{
	description = "nix solves this katanya";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
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
							home-manager.users.yoda = import ./home;
							home-manager.extraSpecialArgs = { inherit inputs; };
							home-manager.sharedModules = [
								nixvim.homeManagerModules.nixvim
							];
						}
					];
				};

			};

		};
}
