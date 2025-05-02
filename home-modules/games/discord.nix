#
# Discord messaging
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
  ];
}
