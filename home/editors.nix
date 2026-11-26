{config, pkgs, ...}:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    initLua = ''
      require("main")
    '';
  };

  xdg.configFile."nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/configs/neovim/lua";
    force = true;
  };

  programs.vscodium.enable = true;
}
