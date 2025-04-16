{pkgs, ...}: {
  ##################################################################################################################
  #
  # All Ryan's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/shell
  ];

  programs.git = {
    userName = "Fraser MacColl";
    userEmail = "fraser.a.maccoll@gmail.com";
  };
}
