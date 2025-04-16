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
    jetbrains-toolbox
  ];
}
