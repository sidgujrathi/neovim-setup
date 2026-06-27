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

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
    opts = {
      git = {
        enable = true,
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = 'Telescope',
    opts = {},
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  {
    'neoclide/coc.nvim',
    branch = 'release',
    lazy = false,
    init = function()
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-tsserver',
        'coc-eslint',
        'coc-prettier',
        'coc-docker',
      }
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '' },
        changedelete = { text = '~' },
      },
    },
  },
  'tpope/vim-fugitive',

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
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
  },

  'editorconfig/editorconfig-vim',
}
