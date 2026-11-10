#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open3'
require 'pathname'
require 'tempfile'
require 'tmpdir'
require 'yaml'

def inspect_gpg(text)
  unless text.match?(/\A-----BEGIN PGP PUBLIC KEY BLOCK-----\n.*\n-----END PGP PUBLIC KEY BLOCK-----\n\z/m)
    abort 'Choose an ASCII armored GPG public key export (.asc).'
  end

  output = Dir.mktmpdir('inspect-public-key') do |home|
    stdout, _stderr, result = Open3.capture3(
      'gpg', '--no-options', '--homedir', home, '--batch', '--with-colons',
      '--with-fingerprint', '--show-keys', stdin_data: text
    )
    abort 'GPG could not read this public key.' unless result.success?
    stdout
  end

  records = output.lines.map { |line| line.chomp.split(':', -1) }
  primary_keys = records.select { |record| record[0] == 'pub' }
  abort 'Choose an export containing exactly one primary public key.' unless primary_keys.length == 1
  abort 'Secret key material is not supported.' if records.any? { |record| %w[sec ssb].include?(record[0]) }

  primary = primary_keys.first
  fingerprint = records.drop_while { |record| record != primary }.find { |record| record[0] == 'fpr' }&.[](9)
  abort 'GPG did not return a public key fingerprint.' unless fingerprint&.match?(/\A[0-9A-F]+\z/)

  # Algorithm and curve fields follow GnuPG's documented colon listing format.
  algorithm = {
    1 => 'RSA', 2 => 'RSA', 3 => 'RSA', 16 => 'ElGamal', 17 => 'DSA',
    18 => 'ECDH', 19 => 'ECDSA', 20 => 'ElGamal', 22 => 'EdDSA',
    25 => 'X25519', 26 => 'X448', 27 => 'Ed25519', 28 => 'Ed448', 35 => 'Kyber'
  }.fetch(primary[3].to_i, "OpenPGP #{primary[3]}")
  curve = primary[16].to_s
  label = if curve.empty?
            [algorithm, primary[2]].join(' ')
          elsif curve.match?(/\Aed(?:25519|448)\z/i)
            curve.sub(/\Aed/i, 'Ed')
          else
            [algorithm, curve].join(' ')
          end
  [label, fingerprint.scan(/.{1,4}/).join(' ')]
end

def inspect_ssh(text)
  abort 'Choose a file containing exactly one SSH public key.' unless text.lines.length == 1

  output = Tempfile.create('inspect-ssh-public-key') do |file|
    file.write(text)
    file.flush
    stdout, _stderr, result = Open3.capture3('ssh-keygen', '-l', '-E', 'sha256', '-f', file.path)
    abort 'ssh-keygen could not read this public key.' unless result.success?
    stdout
  end

  match = output.match(/\A(\d+)\s+(SHA256:\S+).*\(([^)]+)\)\s*\z/)
  abort 'ssh-keygen did not return a public key fingerprint.' unless match
  label = case match[3]
          when 'ED25519' then 'Ed25519'
          when 'ED25519-SK' then 'Ed25519 (security key)'
          else [match[3], match[1]].join(' ')
          end
  [label, match[2]]
end

if ARGV.length != 2 || !%w[gpg ssh].include?(ARGV[0])
  abort 'Usage: ruby tools/update-public-key.rb <gpg|ssh> <public-key-file>'
end

begin
  key_id, source = ARGV
  text = Pathname(source).read.gsub(/\r\n?/, "\n").strip + "\n"
  abort 'Private key material is not supported.' if text.match?(/PRIVATE KEY|SECRET KEY/)
  algorithm, fingerprint = key_id == 'gpg' ? inspect_gpg(text) : inspect_ssh(text)

  destination = Pathname(__dir__).join('../_data/public_keys.yml').expand_path
  keys = YAML.safe_load(destination.read)
  keys.fetch(key_id).merge!('algorithm' => algorithm, 'fingerprint' => fingerprint, 'public_key' => text)
  destination.write(YAML.dump(keys).delete_prefix("---\n"))
  puts "Updated #{key_id.upcase}: #{algorithm}"
  puts "Fingerprint: #{fingerprint}"
rescue Errno::ENOENT => error
  abort "Could not find the public key file or required command: #{error.message}"
rescue Psych::Exception, KeyError => error
  abort "Could not update the key settings: #{error.message}"
end
