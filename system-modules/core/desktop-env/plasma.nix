#
# KDE Plasma 6 DE setup and default config
#

{ pkgs, ... }:
{
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # Remove unwanted packages installed with plasma
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    plasma-browser-integration
    elisa
    gwenview
    kwallet
    khelpcenter
  ];
}
