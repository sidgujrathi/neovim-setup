return {
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
}
