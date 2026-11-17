{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    proton-vpn
  ];
}
