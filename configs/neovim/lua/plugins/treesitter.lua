return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        if not pcall(vim.treesitter.start, args.buf) then
          return
        end

        local win = vim.api.nvim_get_current_win()

        vim.wo[win].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[win].foldmethod = 'expr'
        vim.wo[win].foldlevel = 99

        vim.bo[args.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}