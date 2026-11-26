local lang_settings = {
    c = { name = 'clangd' },
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
}
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = lang_settings,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}