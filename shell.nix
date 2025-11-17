{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    starship
    eza
    ruby_3_4
    pkg-config
    nodejs_24
    yarn
    gcc
    gnumake
  ];
  shellHook = ''
    export GEM_HOME="$PWD/.gems"
    export GEM_PATH="$PWD/.gems"
    export PATH="$GEM_HOME/bin:$PATH"

    mkdir -p "$GEM_HOME"

    # extract installed bundler version (if any)
    INSTALLED_VERSION=$(bundler -v 2>/dev/null | awk '{print $3}')

    # fetch latest version number from rubygems.org
    LATEST_VERSION=$(gem list "^bundler$" --remote \
        | head -n1 \
        | sed -E 's/.*\(([^)]*)\).*/\1/' \
        | tr ',' '\n' \
        | head -n1 \
        | tr -d ' ')
    if [ -z "$INSTALLED_VERSION" ]; then
      echo "!!! Bundler not installed. Installing Bundler $LATEST_VERSION..."
      gem install bundler -v "$LATEST_VERSION" --no-document
    elif [ "$INSTALLED_VERSION" != "$LATEST_VERSION" ]; then
      echo "Updating Bundler: $INSTALLED_VERSION → $LATEST_VERSION"
      gem install bundler -v "$LATEST_VERSION" --no-document
    else
      echo "Bundler is up to date ($INSTALLED_VERSION)"
    fi

    echo "Using Bundler: $(bundler -v)"
  '';
}
