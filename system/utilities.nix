{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    btop
    nvitop
  ];
  
  services = {
    locate.enable = true;
    playerctld.enable = true;
    udisks2.enable = true;
  };
}
