#
# Other imports, utilities and other uncategorised stuff.
#

{
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    kdePackages.kcalc
  ];
}
