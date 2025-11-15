{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    bundler
    rubyPackages.jekyll

    # build tools (Debian: build-essential)
    gcc
    gnumake
    binutils

    # equivalent of zlib1g-dev
    zlib
    zlib.dev

    nodejs_24

    libxml2
    libxslt
    openssl

    # Text processing tools used in scripts
    gnused
    gnugrep
    findutils
  ];

  # Ruby needs this to find native extension headers
  RUBY_CONFIGURE_OPTS = "--with-zlib-include=${pkgs.zlib.dev}/include --with-zlib-lib=${pkgs.zlib}/lib";
}

