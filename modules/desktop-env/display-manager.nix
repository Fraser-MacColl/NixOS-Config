#
# Set up the display manager, in this case SDDM
#

{
  ...
}: {
  services.displayManager.sddm = {
    enable = true;

    settings = {
      general = {
        Numlock = "on";
      };
    };
  };
}
