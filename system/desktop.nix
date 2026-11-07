{ config, lib, pkgs, ... }:

{
  config = {
    specialisation.kde.configuration.my.desktop = "kde";
    services.gnome.gnome-keyring.enable = true;
  };

  imports = [
    ./desktops/kde.nix
    ./desktops/noctalia.nix
  ];

  options.my.desktop = lib.mkOption {
    type = lib.types.enum [ "noctalia" "kde" ];
    default = "noctalia";
  };
}
