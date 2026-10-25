{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	  git
	  gh
	];

	programs.lazygit.enable = true;
}
