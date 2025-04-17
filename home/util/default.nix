#
# Other imports, utilities and other uncategorised stuff.
#

{
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix
    ./zed.nix
#    ./rclone.nix
    # Having issues getting rclone working properly on startup, but
    # otherwise looks like it should work once I get that sorted.
  ];

  home.packages = with pkgs; [
    kdePackages.kcalc
    kdePackages.dolphin
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
