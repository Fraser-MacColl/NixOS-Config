#
# Set up the systems login manager and desktop environments
#

{
  ...
}: {
  imports = [
    ./display-manager
    ./plasma.nix
  ];

  # Hint at electron applications to use wayland instead of x11
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
