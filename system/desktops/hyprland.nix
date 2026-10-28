{ config, lib, pkgs, ... }:

lib.mkIf (config.my.desktop == "hyprland") {
  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
