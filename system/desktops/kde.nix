{ config, lib, pkgs, ... }:

lib.mkIf (config.my.desktop == "kde") {
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = false;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
    okular
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.filelight
  ];
}
