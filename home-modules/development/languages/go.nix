#
# Go lang setup
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go
  ];
}
