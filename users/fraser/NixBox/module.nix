#
# System module to be loaded by the NixOS config for NixBox
#

{ ... }:
{
  # User account setup
  users.users."fraser"= {
    isNormalUser = true;
    description = "fraser";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.trusted-users = [ "fraser" ];
}
