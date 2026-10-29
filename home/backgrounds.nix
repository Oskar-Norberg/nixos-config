{ config, lib, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  xdg.configFile."backgrounds" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/backgrounds";
    force = true;
  };
}
