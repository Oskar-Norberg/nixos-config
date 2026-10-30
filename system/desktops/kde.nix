{ config, lib, pkgs, ... }:

lib.mkIf (config.my.desktop == "kde") {
  # TODO: Verify that gnome-keyring takes precedence over kwallet
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = false;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  security.pam.services.sddm = {
    enableGnomeKeyring = true;
    kwallet.enable = lib.mkForce false;
  };

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      kate
      elisa
      okular
    ];

    systemPackages = with pkgs; [
      kdePackages.filelight
    ];
  };
}
