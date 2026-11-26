{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    btop
    nvitop
    unzip
    ripgrep
  ];
  
  services = {
    locate.enable = true;
    playerctld.enable = true;
    udisks2.enable = true;
  };
}
