{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    btop
    nvitop
    unzip
    ripgrep
    fd
  ];
  
  services = {
    locate.enable = true;
    playerctld.enable = true;
    udisks2.enable = true;
  };
}
