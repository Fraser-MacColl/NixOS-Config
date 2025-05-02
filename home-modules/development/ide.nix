#
# IDEs setup
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.goland
    jetbrains.rust-rover
    jetbrains.idea-ultimate
  ];
}
