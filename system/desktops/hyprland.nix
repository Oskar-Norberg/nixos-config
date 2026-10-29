{ config, lib, pkgs, pkgs-unstable, noctalia, noctalia-greeter, ... }:

{
  imports = [ 
    noctalia.nixosModules.default
    noctalia-greeter.nixosModules.default 
  ];

  config = lib.mkIf (config.my.desktop == "hyprland") {
    # TODO: Theming/Config
    # TODO: passwordlessSyncUsers
    # Greeter
    services.displayManager.noctalia-greeter = {
      enable = true;
    };

    # TODO: Config
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
