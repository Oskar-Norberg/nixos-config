{ config, pkgs, nixvim, ... }:

{
  imports = [
    nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals = {
      mapleader = " ";
    };
    opts = {
      number = true;
      relativenumber = true;
    };

    nixpkgs.useGlobalPackages = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      lazygit.enable = true;
      web-devicons.enable = true;
      todo-comments.enable = true;
      ts-comments.enable = true;
      gitsigns.enable = true;
      dashboard.enable = true;
      tiny-inline-diagnostic.enable = true;

      mini-tabline.enable = true;

      yanky = {
        enable = true;
        enableTelescope = true;
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        folding.enable = false;
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Find files";
          };
          "<leader>fg" = {
            action = "live_grep";
            options.desc = "Live grep";
          };
          "<leader>fb" = {
            action = "buffers";
            options.desc = "Buffers";
          };
          "<leader>fh" = {
            action = "help_tags";
            options.desc = "Help";
          };
        };
      };
      # Yoinked straight from MikaelFangel/nixvim-config
      lsp = {
        enable = true;
        servers = {
          # Common language servers
          bashls.enable = true;
          clangd.enable = true;
          nixd.enable = true;
          ruff.enable = true;
          pyrefly.enable = true;
          tflint.enable = true;
          marksman.enable = true;

          # Packages is set to null to rely on the system wide installed packages
          # this is done to avoid conflicts with the nixpkgs versions.
          elixirls = {
            enable = true;
            package = null; # default pkgs.elixir-ls
            cmd = [ "elixir-ls" ];
          };
          gleam = {
            enable = true;
            package = null; # default pkgs.gleam
          };
          gopls = {
            enable = true;
            package = null; # default pkgs.gopls
          };
          kotlin_language_server = {
            enable = true;
            package = null; # default pkgs.kotlin-language-server
          };
          prolog_ls = {
            enable = true;
            package = null; # default pkgs.swi-prolog;
          };
          tofu_ls = {
            enable = true;
            package = null; # default pkgs.tofu-l
          };
          harper_ls = {
            enable = true;
            filetypes = [ "markdown" ];
          };
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gr" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
      };
      rustaceanvim.enable = true;
    };

    keymaps = [
      # LazyGit
      {
        mode = "n";
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit";
          silent = true;
        };
      }
    ];

    viAlias = true;
    vimAlias = true;
  };

  programs.vscodium.enable = true;
}