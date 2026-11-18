{ config, pkgs, pkgs-unstable, ... }:

{
  services.flatpak = {
    enable = true;
    # Bottles
    packages = [ "com.usebottles.bottles" ];
    overrides."com.usebottles.bottles".Context.filesystems = [
      "!home"
      "!host"
      "!xdg-download"
      "!xdg-data/applications"
      "~/Downloads/BottlesShared:ro"
    ];
    update.onActivation = true;
  };
}
