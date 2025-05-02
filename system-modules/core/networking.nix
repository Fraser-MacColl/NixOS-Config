#
# Default networking config
# Hostname needs to be set in host specific config however
#

{ ... }:
{
  networking.networkmanager.enable = true;

  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
}
