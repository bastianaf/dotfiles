# neovim

Minimal hand-crafted config (~240 lines) using Neovim's built-in `vim.pack.add()` package manager. Based on [Wout Vossen's pookie-dotfiles](https://github.com/vossenwout/pookie-dotfiles).

## Core settings

| Setting | Value |
|---------|-------|
| Leader key | `Space` |
| Line numbers | Relative + absolute |
| Search | Case-insensitive (smartcase) |
| Clipboard | Synced with system clipboard |
| Swap files | Disabled |
| Auto-format on save | Enabled (via LSP) |
| Theme | Kanagawa Wave |

## Keybinds

| Action | Keybind |
|--------|---------|
| Find files | `Space Space` |
| Search in project | `Space /` |
| Resume last picker | `Space f r` |
| Switch buffers | `Space ,` |
| Go to definition | `g d` |
| Find references | `g r r` |
| Code actions | `g r a` |
| Implementations | `g r i` |
| Show diagnostics | `Space D` |
| File browser (Oil) | `-` |
| File browser (float) | `Space e` |
| Lazygit | `Space g g` |
| Git line history | `Space g l` |
| Open git remote | `Space g b` |
| Code diff (unstaged) | `Space r u` |
| Code diff (vs main) | `Space r m` |
| Code diff (vs HEAD~1) | `Space r h` |
| Next hunk | `] c` |
| Previous hunk | `[ c` |
| Stage hunk | `Space h s` |
| Reset hunk | `Space h r` |
| Blame line | `Space h b` |
| Copy absolute path | `Space c p` |
| Copy relative path | `Space c r` |
| Move between windows | `Ctrl+H/J/K/L` |
| Quit file (keep nvim) | `:bd` |

## LSP servers

```bash
# Python
brew install ruff

# Lua
brew install lua-language-server

# TypeScript
npm i -g typescript-language-server typescript
```

Add new servers to `vim.lsp.enable({})` in `init.lua`.

## See also

- [PLUGINS.md](../PLUGINS.md) — full plugin list with descriptions