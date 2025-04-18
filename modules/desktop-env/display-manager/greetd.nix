#
# Set up greetd login manager, using regreet as the greeter
#

{
  pkgs,
  ...
}: {
  # Use cage comp for running regreet
  services.cage.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -mlast -- regreet";
        user = "greeter";
      };
    };
  };

  programs.regreet.enable = true;
}
