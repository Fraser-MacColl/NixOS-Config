#
# IDEs setup
#

{
  pkgs,
  config,
  username,
  ...
}: {
  home.packages = with pkgs; [
    #jetbrains-toolbox
    jetbrains.goland
    jetbrains.rust-rover
    jetbrains.idea-ultimate
  ];
}
