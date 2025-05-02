#
# Miscellaneous other system configs
#

{
  ...
} : {
  # Enable sound with pipewire.
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Enable CUPS to print documents.
    printing.enable = true;
  };
}
