{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [ hugo dart-sass nodejs python3 ruby gnupg ];
}
