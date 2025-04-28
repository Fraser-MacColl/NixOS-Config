#
# Rust lang setup
#

{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rustup
    gcc # C++ toolchain needed for compilation, linker or something from it
  ];
}

## Copied from https://wiki.nixos.org/wiki/Rust
#{
#  #pkgs ? import <nixpkgs> { },
#  pkgs,
#  ...
#}:
#let
#  overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
#in
#pkgs.callPackage (
#  {
#    stdenv,
#    mkShell,
#    rustup,
#    rustPlatform,
#  }:
#  mkShell {
#    strictDeps = true;
#    nativeBuildInputs = [
#      rustup
#      rustPlatform.bindgenHook
#    ];
#    # libraries here
#    buildInputs =
#      [
#      ];
#    RUSTC_VERSION = overrides.toolchain.channel;
#    # https://github.com/rust-lang/rust-bindgen#environment-variables
#    shellHook = ''
#      export PATH="''${CARGO_HOME:-~/.cargo}/bin":"$PATH"
#      export PATH="''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-${stdenv.hostPlatform.rust.rustcTarget}/bin":"$PATH"
#    '';
#  }
#) { }
