{config, pkgs, ...}:

{
  imports = [
    ./desktops/kde.nix
    ./desktops/hyprland.nix
  ];
}
