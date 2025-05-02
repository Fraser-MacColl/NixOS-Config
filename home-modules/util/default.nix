#
# Other imports, utilities and other uncategorised stuff.
#

{ pkgs, ... }:
{
  imports = [
    ./xdg.nix
    ./fonts.nix
    ./zed.nix
    ./rclone.nix
    ./dolphin.nix
  ];

  home.packages = with pkgs; [
    kdePackages.kcalc
    libnotify
  ];

  programs = {
    firefox.enable = true;
    chromium.enable = true;
  };

  services = {
    # auto mount usb drives
    udiskie.enable = true;
  };
}
