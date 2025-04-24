#
# Shared NixOS module amongst all installations.
# This module sets up:
#  - User account (Password needs set if first time installation)
#  - Localisation of languages, text formatting, timezone, keyboard
#  - System fonts and packages, accessible from root
#  - Other miscellaneous setup, like audio and CUPS
#
# What this DOES NOT set up:
#  - Networking, assuming each host will need unique setups
#  - The DE/WM of the system
#

{
  pkgs,
  lib,
  username,
  ...
}: {

  # #=--------=#
  # |  KERNEL  |
  # #=--------=#

  # Zen kernel default
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # #=---------------=#
  # |  GENERAL SETUP  |
  # #=---------------=#

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };

  nix.settings = {
    trusted-users = [username];
    experimental-features = ["nix-command" "flakes"]; # enable flakes globally

    # Binary caches
    require-sigs = true;
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      # Packages from the binary caches need to be signed by any of these keys to be valid,
      # so only put keys from trusted sources!
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };





  # #=--------------=#
  # |  LOCALISATION  |
  # #=--------------=#

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };





  # #=-----------------=#
  # |  SYSTEM PACKAGES  |
  # #=-----------------=#

  nixpkgs.config.allowUnfree = true;

  # DE/WM + Login
  imports = [ ./desktop-env ];

  # FONTS
  fonts = {
    packages = with pkgs; [
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

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  # PACKAGES
  # Ideally only necessary for system admin, root accessible stuff.
  # Anything user facing can be managed by HM
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];





  # #=---------------=#
  # |  MISCELLANEOUS  |
  # #=---------------=#

  # Enable sound with pipewire.
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
