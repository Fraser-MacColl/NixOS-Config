#
# Rust lang setup
#

{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rustup
  ];
}
