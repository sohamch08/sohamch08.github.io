{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    eza
    ruby_3_4
    pkg-config
    nodejs_24
    yarn
    gcc
    gnumake
  ];
  # GEM_HOME = ".gems";
  # GEM_PATH = ".gems";
  # PATH = "$GEM_HOME/bin:${pkgs.ruby_3_4}/bin:${pkgs.nodejs_24}/bin:${pkgs.yarn}/bin:$PATH";
  shellHook = ''
    export GEM_HOME="$PWD/.gems"
    export GEM_PATH="$PWD/.gems"
    export PATH="$GEM_HOME/bin:$PATH"

    echo "Ensureing latest bundler is installed..."

    # Install/update to latest bundler
    gem install bundler --no-document

    echo "Bundler version: $(bundler -v)"
  '';
}
