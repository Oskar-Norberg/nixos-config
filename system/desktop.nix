{ config, lib, pkgs, ... }:

{
  config.specialisation.hyprland.configuration.my.desktop = "hyprland";

  imports = [
    ./desktops/kde.nix
    ./desktops/hyprland.nix
  ];

  options.my.desktop = lib.mkOption {
    type = lib.types.enum [ "hyprland" "kde" ];
    default = "kde";
  };
}
