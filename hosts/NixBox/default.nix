#
# NixOS module with NixBox specific configuration.
#

{ ... }:
{
  networking.hostName = "NixBox";

  imports = [
    ./hardware-configuration.nix
    ../../system-modules/core
    ../../system-modules/steam.nix

    # User modules
    # For each user that should be present on the this host,
    # import their specific system module whcih sets up their user account.
    ../../users/fraser/NixBox/module.nix
  ];

  # Any host specific overrides can be put here E.G.
  # boot.kernelPackages = lib.mkForce lib.pkgs.linuxPackages_zen;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
