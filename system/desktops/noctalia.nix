{ config, lib, pkgs, pkgs-unstable, noctalia, noctalia-greeter, ... }:

{
  imports = [ 
    noctalia.nixosModules.default
    noctalia-greeter.nixosModules.default 
  ];

  config = lib.mkIf (config.my.desktop == "noctalia") {
    # TODO: Theming/Config
    # TODO: passwordlessSyncUsers
    # Greeter
    services.displayManager.noctalia-greeter = {
      enable = true;
    };

    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
