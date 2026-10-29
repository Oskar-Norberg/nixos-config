{ config, lib, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/hyprland";
    force = true;
  };

  xdg.configFile."ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/ghostty";
    force = true;
  };

  home.file.".local/state/noctalia/settings.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/noctalia/settings.toml";
    force = true;
  };

  programs.ghostty = {
    enable = true;
    # TODO: Could be integrated with the shell helper in system. But honestly not needed
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    kdePackages.dolphin
  ];

  home.pointerCursor = {
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
  };
}
