{
  description = "Fraser's NixOS config for all devices";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
}:
{
  nixosConfigurations = {
    NixBox = let
      hostname = "NixBox";
      specialArgs = {inherit hostname;};
    in
      nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          # System
          ./hosts/NixBox

          # Users
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "HM-backup";

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.fraser = import ./users/fraser/NixBox;
          }
        ];
    };

    TestSys.nixpkgs.lib.nixosSystem = {
      system = "x86_64-linux";
      modules = [
        # System
        ./hosts/TestSys

        # Users
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "HM-backup";

          home-manager.extraSpecialArgs.hostname = "TestSys";
          home-manager.users.fraser = import ./users/fraser/TestSys;
        }
      ];
    };
  };
};
}
