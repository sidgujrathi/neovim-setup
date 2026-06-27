# neovim-setup

Modular Neovim config with lazy.nvim. 14 plugins, 3 themes, built-in LSP via coc.nvim.

## Prerequisites

- Neovim **>= 0.9.0**
- `git` (for lazy.nvim bootstrap)
- [Nerd Font](https://www.nerdfonts.com/) (optional — icons in nvim-tree/lualine)

## Installation

```bash
# Clone repo somewhere permanent
git clone <repo-url> ~/projects/neovim-setup

# Symlink into ~/.config
ln -sf ~/projects/neovim-setup/nvim ~/.config/nvim

# Open Neovim — plugins install automatically
nvim
```

**Why symlink?** Config lives in one place. Updating is just `git pull` — no manual copying to every machine.

## Plugins

| Plugin | Purpose | Load Trigger |
|---|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager | Bootstrap |
| [gruvbox](https://github.com/morhetz/gruvbox) | Color scheme (default) | Startup |
| [dracula](https://github.com/dracula/vim) | Color scheme (optional) | Manual |
| [iceberg.vim](https://github.com/cocopon/iceberg.vim) | Color scheme (optional) | Manual |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer | `:NvimTreeToggle` / `:NvimTreeFindFile` |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons | Dependency |
| [telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder | `:Telescope` |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Statusline | VeryLazy |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | LSP / autocomplete | Startup |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git signs in gutter | BufReadPre |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands | Lazy |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets | InsertEnter |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Modern syntax highlighting | Startup |
| [editorconfig](https://github.com/editorconfig/editorconfig-vim) | EditorConfig support | Lazy |

## Key Mappings

| Key | Action | Mode |
|---|---|---|
| `Ctrl-L` | Escape | Insert, Visual |
| `Ctrl-S` | Save file | Normal |
| `leader a` (leader = `\`) | Select all | Normal |
| `Ctrl-P` | Telescope find files | Normal |
| `Ctrl-F` | Telescope live grep | Normal |
| `Ctrl-N` | Toggle file tree | Normal |
| `Ctrl-B` | Reveal current file in tree | Normal |
| `leader \`` | Horizontal terminal split | Normal |
| `leader 1` | Resize window to 21 lines | Normal |
| `ot` | New tab | Normal |
| `Ctrl-T n` | Next tab | Normal |
| `Ctrl-T p` | Previous tab | Normal |
| `gd` | Go to definition | Normal |
| `gr` | Find references | Normal |
| `leader cd` | Show diagnostics | Normal |
| `leader c` | Copy to system clipboard | Normal, Visual |
| `leader v` | Paste from system clipboard | Normal, Visual |

## Changing Theme

Edit `nvim/lua/user/plugins/init.lua`. Replace the gruvbox block:

```lua
-- Iceberg
require('lazy').setup('user.plugins', {
  install = { colorscheme = { 'iceberg' } },
})
-- Then in the gruvbox block, change the config function:
config = function()
  vim.cmd.colorscheme('iceberg')
end,
```

Or activate from within Neovim: `:colorscheme dracula`

## Customization

**Add a plugin:** Append entry to `plugins/init.lua`:

```lua
{
  'author/plugin-name',
  event = 'BufReadPre',
  opts = { ... },
}
```

**Change settings:** Edit `lua/user/core/options.lua`. Each line is one option with a comment explaining what it does.

**Add keymaps:** Edit `lua/user/core/keymaps.lua`. Follow existing pattern:

```lua
vim.keymap.set('n', '<leader>x', ':SomeCommand<CR>', { silent = true })
```

## File Structure

```
~/.config/nvim/
├── init.lua                  Entry point — loads config/lazy.lua
├── init.vim.bak              Original Vimscript config (reference only)
└── lua/
    ├── config/
    │   └── lazy.lua          Bootstrap lazy.nvim, setup plugins, load core
    ├── plugins/
    │   ├── colorscheme.lua   Gruvbox (default) + dracula + iceberg + devicons
    │   ├── nvim-tree.lua     File explorer
    │   ├── telescope.lua     Fuzzy finder
    │   ├── lualine.lua       Statusline
    │   ├── coc.lua           LSP / autocomplete
    │   ├── gitsigns.lua      Git signs in gutter
    │   ├── fugitive.lua      Git commands
    │   ├── autopairs.lua     Auto-close brackets
    │   ├── treesitter.lua    Modern syntax highlighting
    │   └── editorconfig.lua  EditorConfig support
    └── user/core/
        ├── options.lua       Editor settings (line numbers, tabs, search, etc.)
        └── keymaps.lua       All key bindings
```

Each file in `lua/plugins/` returns a lazy.nvim spec table. Files are auto-discovered and merged by lazy.nvim. No manual `require` needed.

## Lazy-loading Strategy

- **Startup (lazy=false):** coc.nvim, gruvbox, nvim-treesitter — needed immediately
- **Lazy (event/cmd):** gitsigns (BufReadPre), nvim-tree (cmd), telescope (cmd), lualine (VeryLazy)
- **Manual:** fugitive, editorconfig, dracula, iceberg — loaded on demand

## Troubleshooting

| Problem | Fix |
|---|---|
| Plugins not installed | Run `:Lazy sync` |
| Treesitter parse errors | Run `:TSUpdate` |
| LSP not working | Run `:CocInstall coc-tsserver coc-json` (or check `coc_global_extensions` in init.lua) |
| Missing icons | Install a Nerd Font and set terminal to use it |
