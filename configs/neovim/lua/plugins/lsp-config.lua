return {
  {
    'mason-org/mason.nvim',
    opts = {
      PATH = "append",
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        -- Put extra languages not provided by nix here
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd" })
    end,
  },
}
