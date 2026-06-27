return {
  'nvim-tree/nvim-web-devicons',
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_contrast_dark = 'hard'
    end,
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  'dracula/vim',
  'cocopon/iceberg.vim',
}
