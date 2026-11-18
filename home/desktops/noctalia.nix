{ config, lib, pkgs, pkgs-unstable, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/noctalia/hyprland";
    force = true;
  };

  xdg.configFile."kitty/custom.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/kitty/custom.conf";

  home.file.".local/state/noctalia/settings.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/noctalia/config/settings.toml";
    force = true;
  };

  fonts.fontconfig.enable = true;

  programs = {
    imv.enable = true;

    yazi = {
      enable = true;
      package = pkgs-unstable.yazi;
    };

    kitty = {
      enable = true;
      package = pkgs-unstable.kitty;

      # TODO: Could be integrated with the shell helper in system. But honestly not needed
      shellIntegration.enableZshIntegration = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = 10;
      };

      extraConfig = "
        include custom.conf 
        include themes/noctalia.conf
      ";
    };
  };

  home.pointerCursor = {
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
  };

  # --- Default Apps ---
  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = lib.genAttrs [
      "image/png"
      "image/jpeg"
      "image/gif"
      "image/webp"
      "image/bmp"
      "image/tiff"
      "image/svg+xml"
    ] (_: "imv.desktop");
  };
}
