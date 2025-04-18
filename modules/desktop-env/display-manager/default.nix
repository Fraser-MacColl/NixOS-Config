#
# Import the desired display manager
#

{
  ...
}: {
  imports = [
    # Some weird shit happening in greetd with cage, need to sort
#    ./greetd.nix
    ./sddm.nix
  ];
}
