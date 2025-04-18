#
# KDE Plasma 6 DE setup and default config
#

{
  pkgs,
  ...
}: {
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
}
