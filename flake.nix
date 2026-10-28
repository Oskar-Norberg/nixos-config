{
	description = "Desktop Config";

	inputs = {
		#TODO: Temporary workaround cause this hasn't been merged yet.
		nixpkgs-spotifast.url = "github:DmitrySkibitsky/nixpkgs/ab725efe238a662154c2138598ee4bec36f47ac0";

		nixpkgs.url = "nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/release-26.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};
	
	# TODO: Temporary spotifast override
	outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-spotifast, home-manager, ...}:
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
				};
			};
		};
		homeConfigurations = {
			ringo = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
				extraSpecialArgs = {
					inherit pkgs-unstable;
				};
			};
		};
	};
}
