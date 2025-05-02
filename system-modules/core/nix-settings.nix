#
# System settings for the nix package manager
#

{
  ...
} : {
  nix.settings = {
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
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
