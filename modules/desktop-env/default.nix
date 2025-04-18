#
# Set up the systems login manager and desktop environments
#

{
  ...
}: {
  imports = [
    ./display-manager.nix
    ./plasma.nix
  ];
}
