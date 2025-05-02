#
# Set up greetd login manager, using regreet as the greeter
#

{ pkgs, ... }:
{
  # Display manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config /etc/greetd/sway-config";
        user = "greeter";
      };
    };
  };

  # Use sway comp for running regreet
  environment.systemPackages = with pkgs; [ sway swaybg ];
  environment.etc."greetd/sway-config".text = ''
# Notice that `swaymsg exit` will run after ReGreet.
exec "${pkgs.greetd.regreet}/bin/regreet; swaymsg exit"

output eDP1 mode 2560x1440@170 bg /etc/greetd/wallpaper.png

input type:pointer {
    accel_profile flat
}

bindsym Mod4+shift+e exec swaynag \
-t warning \
-m 'What do you want to do?' \
-b 'Poweroff' 'systemctl poweroff' \
-b 'Reboot' 'systemctl reboot'

include /etc/sway/config.d/*
'';
  # Put login screen wallpaper in the /etc folder
  environment.etc."greetd/wallpaper.png".source = ../../../images/Pink_Blue.png;

  # Login manager
  programs.regreet.enable = true;
}
