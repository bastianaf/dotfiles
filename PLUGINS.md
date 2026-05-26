# PLUGINS.md

Neovim plugins managed via `vim.pack.add()` in `neovim/.config/nvim/init.lua`.

## Current plugins

| Plugin | Purpose |
|--------|---------|
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder — files, grep, buffers, LSP references |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocomplete with signature help |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language server protocol |
| [mini.icons](https://github.com/echasnovski/mini.icons) | File/type icons |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File browser |
| [codediff.nvim](https://github.com/esmuellert/codediff.nvim) | VS Code-style diff view |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git UI integration |
| [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) | Smooth scrolling |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Start screen / dashboard |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown rendering |
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Color theme |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter markers (+/-/~ in sign column) |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME/HACK/WARN in comments |

## Adding a plugin

1. Add the GitHub URL to `vim.pack.add({})` in `neovim/.config/nvim/init.lua`
2. Add a row to the table above with a brief description
3. Commit and push both files