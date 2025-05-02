#
# Default Home-Manager fonts
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # icon fonts
    material-design-icons

    # normal fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    # nerdfonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
