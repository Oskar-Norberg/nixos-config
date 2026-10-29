{
	description = "Desktop Config";

	inputs = {
		#TODO: Temporary workaround cause this hasn't been merged yet.
		nixpkgs-spotifast.url = "github:DmitrySkibitsky/nixpkgs/ab725efe238a662154c2138598ee4bec36f47ac0";

		nixpkgs.url = "nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/release-26.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		noctalia-greeter = {
			url = "github:noctalia-dev/noctalia-greeter";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	nixConfig = {
		extra-substituters = [ "https://noctalia.cachix.org" ];
		extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
	};
	
	# TODO: Temporary spotifast override
	outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-spotifast, home-manager, noctalia, noctalia-greeter, ...}:
	let
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
		# TODO: Temporary spotifast override
		pkgs-unstable = import nixpkgs-unstable {
			inherit system;
			overlays = [
				(final: prev: {
					spotifast = (import nixpkgs-spotifast {
						inherit system;
					}).spotifast;
				})
			];
		};
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [ ./configuration.nix ];
				specialArgs = {
					inherit pkgs-unstable;
					inherit noctalia;
					inherit noctalia-greeter;
				};
			};
		};
		homeConfigurations = {
			ringo = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
				extraSpecialArgs = {
					inherit pkgs-unstable;
					inherit noctalia;
					inherit noctalia-greeter;
				};
			};
		};
	};
}
