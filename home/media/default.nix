#
# Media related imports.
#

{
  pkgs,
  ...
}: {
  imports = [
    ./imv.nix
    ./feh.nix
  ];

  # Other packages
  home.packages = with pkgs; [
    audacity
    vlc
    spotify
  ];
}
