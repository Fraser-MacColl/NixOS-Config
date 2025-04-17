{
  lib,
  pkgs,
  catppuccin-bat,
  ...
}: {
  home.packages = with pkgs; [
    # misc
    libnotify
    zed-editor
    ranger
  ];

  programs = {
    btop.enable = true; # replacement of htop/nmon
  };

  services = {
    # auto mount usb drives
    udiskie.enable = true;
  };
}
