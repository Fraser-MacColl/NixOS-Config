#
# Nix setup
#

{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nixd # Nix language server
    alejandra # Formatter
    deadnix # Unused code
    statix # Lints
  ];
}
