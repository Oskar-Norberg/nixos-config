{ config, lib, pkgs, pkgs-unstable, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/noctalia/hyprland";
    force = true;
  };

  xdg.configFile."ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/ghostty";
    force = true;
  };

  home.file.".local/state/noctalia/settings.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/noctalia/config/settings.toml";
    force = true;
  };

  programs = {
    ghostty = {
      enable = true;
      # TODO: Could be integrated with the shell helper in system. But honestly not needed
      enableZshIntegration = true;
      package = pkgs-unstable.ghostty;
    };

    imv.enable = true;
    yazi = {
      enable = true;
      package = pkgs-unstable.yazi;
    };
    # TODO: Disable once ghostty gets dnd support. Or switch to kitty fulltime
    kitty = {
      enable = true;
      package = pkgs-unstable.kitty;
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
