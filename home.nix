#
# Root home nix file used by HM.
# Desired user packages should be set up here using the provided files in the ./home directory.
#

{
  pkgs,
  ...
}: {
  imports = [
    ./home/core.nix
    ./home/programs
    ./home/shell
    ./home/development
  ];
}
