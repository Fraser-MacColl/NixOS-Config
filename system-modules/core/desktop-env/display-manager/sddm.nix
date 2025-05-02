#
# Set up the display manager, in this case SDDM
#

{
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Run on wayland
    autoNumlock = true;
  };
}
