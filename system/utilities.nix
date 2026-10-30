{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    btop
  ];
  
  services = {
    locate.enable = true;
    playerctld.enable = true;
  };
}
