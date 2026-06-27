return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.config').setup({
      ensure_installed = {
        'javascript',
        'typescript',
        'json',
        'html',
        'css',
        'lua',
        'vim',
      },
      highlight = {
        enable = true,
      },
    })
  end,
}
