{
	description = "Desktop Config";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager/release-26.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

		nixvim.url = "github:nix-community/nixvim/nixos-26.05";

		noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
		noctalia-greeter = {
			url = "github:noctalia-dev/noctalia-greeter/cachix";
		};
	};

	outputs = { 
		self, 
		nixpkgs, 
		nixpkgs-unstable, 
		nix-flatpak, 
		home-manager, 
		nixvim,
		noctalia, 
		noctalia-greeter, 
		...
	} :
	let
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [ 
					nix-flatpak.nixosModules.nix-flatpak
					./configuration.nix 
				];
				specialArgs = {
					inherit pkgs-unstable;
					inherit noctalia;
					inherit noctalia-greeter;
					inherit nixvim;
				};
			};
		};
		homeConfigurations = {
			ringo = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ 
					nix-flatpak.homeManagerModules.nix-flatpak
					./home.nix 
				];
				extraSpecialArgs = {
					inherit pkgs-unstable;
					inherit noctalia;
					inherit noctalia-greeter;
					inherit nixvim;
				};
			};
		};
	};
}
