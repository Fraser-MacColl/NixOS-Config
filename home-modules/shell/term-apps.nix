#
# Terminal apps and utilities
#

{ ... }:
{
  programs = {
    btop.enable = true;

    ranger = {
      enable = true;
      settings = {
        show_hidden = true;
      };
    };
  };
}
