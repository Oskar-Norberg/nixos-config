{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
  ];
  services.locate.enable = true;
}
