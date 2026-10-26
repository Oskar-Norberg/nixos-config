{config, pkgs, ...}:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = false;
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
