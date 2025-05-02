#
# Default Alacrity terminal home config
#

{ ... }:
let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.95;
        dynamic_padding = true;
        padding = { x = 5; y = 5; };
      };

      scrolling.history = 10000;

      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 12;
      };
    };
  };
}
