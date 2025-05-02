#
# Neovim home module setup
#

{
  pkgs,
  config,
  username,
  ...
}: {
  programs.neovim = {
    enable = true;
  };
}
