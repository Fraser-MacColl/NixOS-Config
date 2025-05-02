{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
  ];

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
