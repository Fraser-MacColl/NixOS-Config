#
# System wide packages
#

{ pkgs, ... }:
{
  # Ideally only necessary for system admin, root accessible stuff.
  # Anything user facing can be managed by HM

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];

}
