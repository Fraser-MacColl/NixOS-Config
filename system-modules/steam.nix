#
# Steam and gamemode need system level access to work properly,
# so here's a module to do that.
#

{ ... }:
{
  programs.steam = {
    enable = true;

    # Open ports in the firewall for Steam Remote Play
    remotePlay.openFirewall = true;
    # Open ports in the firewall for Source Dedicated Server
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;
}
