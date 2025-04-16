#
# Java setup
#

{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    jdk # Latest LTS release, openJDK
  ];
}
