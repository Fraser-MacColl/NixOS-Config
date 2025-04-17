#
# Root home nix file used by HM.
# Desired user packages should be set up here using the provided files in the ./home directory.
#

{
  imports = [
    ./core.nix

    ./media
    ./games
    ./shell
    ./development
    ./util
  ];
}
