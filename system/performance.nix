{config, lib, pkgs, ...}:

{
  programs.gamemode = {
    enable = true;
    settings.general.desiredgov = "performance";
  };
}
