#
# Rclone config, set up to mount onedrive automatically
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rclone
  ];
}
