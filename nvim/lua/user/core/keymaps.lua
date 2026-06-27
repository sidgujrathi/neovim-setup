vim.keymap.set('i', '<C-L>', '<Esc>')
vim.keymap.set('v', '<C-L>', '<Esc>')

vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>a', 'ggVG')

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>', { silent = true })

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-b>', ':NvimTreeFindFile<CR>', { silent = true })

vim.keymap.set('n', '<Leader>`', ':sp | terminal<CR>', { silent = true })
vim.keymap.set('n', '<Leader>1', ':resize 21<CR>', { silent = true })

vim.keymap.set('n', 'ot', ':tabnew')
vim.keymap.set('n', '<C-t>n', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<C-t>p', ':tabprevious<CR>', { silent = true })

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', '<Leader>cd', ':CocDiagnostics<CR>', { silent = true })

vim.keymap.set('n', '<Leader>c', '"+y', { silent = true })
vim.keymap.set('n', '<Leader>v', '"+p', { silent = true })
vim.keymap.set('v', '<Leader>c', '"+y', { silent = true })
vim.keymap.set('v', '<Leader>v', '"+p', { silent = true })
