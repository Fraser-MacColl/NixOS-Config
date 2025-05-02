#
# Default Home-Manager configs for fraser, specific to NixBox host
#

{
  ...
} : {
  # No specific host configuration needed, just fall back to the default
  imports = [
    ../default.nix
  ];
}
