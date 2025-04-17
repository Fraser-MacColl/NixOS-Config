#
# Shell and terminal related imports.
#

{
  ...
}: {
  imports = [
    ./env.nix
    ./bash.nix
    ./alacritty.nix
    ./term-apps.nix
  ];
}
