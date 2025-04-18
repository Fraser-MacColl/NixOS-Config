#
# Set up the display manager, in this case SDDM
#

{
  ...
}: {
  services.displayManager.sddm = {
    enable = true;

    settings = {
      General = {
        Numlock = "on";
      };
    };
  };

  # Workaround to get numlock to be enabled, at least on kwin comp backend
  # See https://github.com/sddm/sddm/issues/1830 for more
  # Stil not working tho
  environment.etc."sddm.conf.d/numlock.conf".text = ''Numlock=on'';
}
