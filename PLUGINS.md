# PLUGINS.md

Neovim plugins managed via [lazy.nvim](https://github.com/folke/lazy.nvim) through [LazyVim](https://www.lazyvim.org/).

## LazyVim defaults (30+ plugins included)

| Category | Key plugins |
|----------|------------|
| LSP | mason.nvim, nvim-lspconfig, null-ls |
| Completion | nvim-cmp (overridden by blink.cmp) |
| Fuzzy finder | fzf-lua |
| Treesitter | nvim-treesitter |
| Git | gitsigns.nvim, lazygit.nvim |
| UI | lualine.nvim, bufferline.nvim, which-key.nvim, noice.nvim |
| Editor | neo-tree.nvim, mini.surround, mini.pairs, mini.ai, todo-comments.nvim |
| Terminal | snacks.nvim (dashboard, notifications, etc.) |

## Custom additions

| Plugin | Purpose | File |
|--------|---------|------|
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Color theme (replaces tokyonight) | `lua/plugins/kanagawa.lua` |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocomplete (replaces nvim-cmp) | `lua/plugins/blink.lua` |
| [codediff.nvim](https://github.com/esmuellert/codediff.nvim) | VS Code-style diff view | `lua/plugins/codediff.lua` |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File browser (alongside neo-tree) | `lua/plugins/oil.lua` |

## Managing plugins

```bash
:Lazy           # open lazy.nvim UI to see all plugins, update, clean
:Lazy update    # update all plugins
:Lazy sync      # sync and update all plugins
```

## Adding a plugin

1. Create `lua/plugins/my-plugin.lua` with the plugin spec
2. Add a row to the table above
3. Commit and push both files