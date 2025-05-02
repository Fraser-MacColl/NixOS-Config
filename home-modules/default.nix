#
# Root home nix file used by HM.
# Desired user packages should be set up here using the provided files in the ./home directory.
#

{
  imports = [
    ./media
    ./productivity
    ./games
    ./shell
    ./development
    ./util
  ];
}
