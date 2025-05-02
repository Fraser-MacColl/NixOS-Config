#
# Development related imports.
#

{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./neovim.nix
    ./languages
    ./ide.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    perf-tools
    linuxPackages_zen.perf
  ];
}
