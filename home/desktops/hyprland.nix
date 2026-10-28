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

  programs.ghostty = {
    enable = true;
    # TODO: Could be integrated with the shell helper in system. But honestly not needed
    enableZshIntegration = true;
    # TODO: Config block
  };

  services.hyprlauncher = {
    enable = true;
  };

  home.packages = with pkgs; [
    kdePackages.dolphin
    wayle
  ];
}
