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
