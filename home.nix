{ config, pkgs, ... }:

{
  home.username = "ringo";
  home.homeDirectory = "/home/ringo";
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf # Manage dotfiles without nix syntax
  imports = [
    ./home/sh.nix
    ./home/git.nix
    ./home/editors.nix
  ];


  programs.home-manager.enable = true;
}
