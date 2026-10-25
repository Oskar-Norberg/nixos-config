{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    neovim
  ];

  home.sessionVariables = {
    EDITOR="nvim";
  };

  programs.vscodium.enable = true;
}
