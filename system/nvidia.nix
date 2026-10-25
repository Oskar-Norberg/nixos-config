# Resources: https://nixos.wiki/wiki/Nvidia#Useful_Tips
{config, lib, pkgs, ...}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  allowedUnfreePackages = [
    "nvidia-x11"
    "nvidia-settings"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    # Set to false if gpu fails to wake from sleep
    # powerManagement.enable = false;

    open = true;

    nvidiaSettings = true;
    
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
