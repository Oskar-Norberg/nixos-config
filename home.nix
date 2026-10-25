{ config, pkgs, ... }:

# TODO: I don't want to have to restart KDE every single update to see a new program
{
  home.username = "ringo";
  home.homeDirectory = "/home/ringo";
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf # Manage dotfiles without nix syntax
  imports = [
    ./home/audio.nix
    ./home/video.nix

    ./home/sh.nix
    ./home/git.nix
    ./home/editors.nix
    ./home/browser.nix

    ./home/games.nix
    ./home/discord.nix
    # ./home/spotify.nix # TODO: Only in unstable rn

    ./home/testing.nix
  ];


  programs.home-manager.enable = true;
}
