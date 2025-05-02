#
# Default system configuration
#

{
  imports = [
    ./kernel.nix
    ./boot.nix
    ./networking.nix
    ./nix-settings.nix
    ./system-packages.nix
    ./localisation.nix
    ./desktop-env
    ./miscellaneous.nix
  ];
}
