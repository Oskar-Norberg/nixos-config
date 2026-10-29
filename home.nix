{ config, pkgs, ... }:

{
  home.username = "ringo";
  home.homeDirectory = "/home/ringo";
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf # Manage dotfiles without nix syntax
  imports = [
    ./helpers/unfree.nix

    ./home/audio.nix
    ./home/video.nix
  
    ./home/backgrounds.nix

    ./home/desktop.nix

    ./home/sh.nix
    ./home/git.nix
    ./home/editors.nix
    ./home/browser.nix

    ./home/games.nix
    ./home/dxvk.nix
    ./home/discord.nix
    ./home/spotify.nix

    ./home/testing.nix
  ];

  programs.home-manager.enable = true;
}
