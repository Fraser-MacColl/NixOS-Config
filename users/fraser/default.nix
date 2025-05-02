#
# Default Home-Manager config
#

{
  ...
} : {

  # Home-Manager stuff
  programs.home-manager.enable = true;
  home = {
    username = "fraser";
    homeDirectory = "/home/fraser";
    stateVersion = "24.11";
  };

  # Import default modules (Basically everything)
  imports = [
    ../../home-modules
  ];

  # Set the git name and email
  programs.git = {
    userName = "Fraser MacColl";
    userEmail = "fraser.a.maccoll@gmail.com";
  };

}
