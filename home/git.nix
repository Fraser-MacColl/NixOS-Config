#
# Git home module setup
#

{
  pkgs,
  config,
  username,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "Fraser MacColl";
    userEmail = "fraser.a.maccoll@gmail.com";
  };
}
