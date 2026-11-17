{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    seafile-client
  ];
}
