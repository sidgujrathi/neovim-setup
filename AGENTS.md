# AGENTS.md — neovim-setup

Modular Neovim config with lazy.nvim.

## Install

```bash
ln -sf ~/projects/neovim-setup/nvim ~/.config/nvim
nvim  # plugins auto-install on first launch
```

No build/test/lint/CI. Just edit config, commit, `git pull` on target machines.

## Structure

```
nvim/
├── init.lua              → require("config.lazy")
├── lazy-lock.json        # pinned plugin commits
└── lua/
    ├── config/lazy.lua   # bootstrap lazy.nvim, sets mapleader, loads options → plugins → keymaps
    ├── plugins/*.lua     # one file per plugin, auto-discovered by lazy.nvim
    └── user/core/
        ├── options.lua   # vim.opt settings
        └── keymaps.lua   # vim.keymap.set (leader = \)
```

## Conventions

- **Add a plugin**: create `lua/plugins/<name>.lua` returning a lazy.nvim spec table. No manual `require` needed.
- **Leader key**: `\` (backslash), set in `config/lazy.lua:14`.
- **coc.nvim global extensions**: defined in `lua/plugins/coc.lua` init function. Current set: coc-json, coc-tsserver, coc-eslint, coc-prettier, coc-docker.
- **Treesitter languages**: in `lua/plugins/treesitter.lua:7-14`. Update `ensure_installed` list there.
- **Theme default**: gruvbox (hard contrast). Change by editing `lua/plugins/colorscheme.lua`.
- **Lazy-loading**: startup = lazy=false (coc, gruvbox, treesitter). Event/cmd = gitsigns (BufReadPre), nvim-tree (cmd), telescope (cmd), lualine (VeryLazy). Manual = fugitive, editorconfig, dracula, iceberg.

## Troubleshooting

- `:Lazy sync` — install/update plugins
- `:TSUpdate` — update treesitter parsers
- `:CocInstall coc-tsserver coc-json` — install LSP extensions
