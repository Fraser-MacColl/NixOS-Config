#
# Git home module setup
#

{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    extraConfig = {
      # GitHub credentials
      credential.helper = "manager";
      credential.credentialStore = "plaintext"; # TODO Make secure

      # Automatically create branches on remote from new local
      push = { autoSetupRemote = true; };
    };
  };

  programs.lazygit = {
    enable = true;
  };

  home.packages = with pkgs; [
    git-credential-manager
  ];
}
