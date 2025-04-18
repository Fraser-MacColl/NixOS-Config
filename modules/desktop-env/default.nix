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
}
