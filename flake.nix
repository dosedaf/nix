{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in

  {
  nixosConfigurations = {
    dosed = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };
      
      modules = [
        ./nixos/configuration.nix
	home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "backup";
            home-manager.users.yoda = import ./nixos/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

  };

  };
}
