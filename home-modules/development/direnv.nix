#
# Environment switcher using .envrc files
#

{ ... }:
{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  # Needs to add hook into every shell being used
  programs.bash.bashrcExtra = ''
eval "$(direnv hook bash)"
'';
}
