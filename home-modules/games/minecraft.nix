#
# Minecraft, managed through prism launcher
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
  ];
}
