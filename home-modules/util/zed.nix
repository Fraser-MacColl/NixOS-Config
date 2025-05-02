#
# Zed editor config
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed/settings.json".text = ''
{
  "telemetry": {
    "diagnostics": false,
    "metrics": false
  },
  "ui_font_size": 16,
  "buffer_font_size": 16,
  "theme": {
    "mode": "system",
    "light": "Ayu Mirage",
    "dark": "One Dark"
  }
}
'';
}
