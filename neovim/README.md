# neovim

[LazyVim](https://www.lazyvim.org/)-based configuration with [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

## Structure

```
neovim/.config/nvim/
├── init.lua                  → LazyVim bootstrap
├── lua/
│   ├── config/
│   │   ├── lazy.lua          → LazyVim core (kept as-is)
│   │   ├── options.lua       → custom vim options
│   │   ├── keymaps.lua       → custom keybinds
│   │   └── autocmds.lua      → custom autocmds
│   └── plugins/
│       ├── kanagawa.lua      → theme override
│       ├── blink.lua         → autocomplete override
│       ├── codediff.lua      → VS Code-style diffs
│       ├── neoscroll.lua     → smooth scrolling
│       ├── oil.lua           → file browser
│       ├── snacks.lua        → dashboard (header + logo + keys)
│       └── gitsigns.lua      → git gutter markers
```

## Core settings (overrides)

| Setting | Value |
|---------|-------|
| Line numbers | Relative + absolute |
| Search | Case-insensitive (smartcase) |
| Clipboard | Synced with system clipboard |
| Swap files | Disabled |
| Theme | Kanagawa Wave (overrides tokyonight) |
| Autocomplete | blink.cmp (replaces nvim-cmp) |

## Custom keybinds

| Action | Keybind |
|--------|---------|
| Copy absolute path | `Space c p` |
| Copy relative path | `Space c r` |
| Show diagnostics | `Space D` |
| Open dashboard | `Space d a` |
| File browser (Oil) | `-` |
| Oil float | `Space e` |
| Code diff (unstaged) | `Space r u` |
| Code diff (vs main) | `Space r m` |
| Code diff (vs HEAD~1) | `Space r h` |

## LazyVim keybind cheatsheet

Press `Space` and wait — **which-key** shows all available keybinds:

| Category | Prefix |
|----------|--------|
| Files | `Space f` |
| Search | `Space s` |
| Git | `Space g` |
| Buffer/Tab | `Space b` |
| Window | `Space w` |
| Debug | `Space d` |
| Code/LSP | `Space c` |
| Toggle UI | `Space u` |

## Plugin management

```bash
:Lazy           # plugin UI
:Lazy sync      # sync all plugins
:Lazy clean     # remove unused plugins
```

## Adding plugins

1. Create `lua/plugins/new-plugin.lua`
2. Add to [PLUGINS.md](../PLUGINS.md)
3. Restart nvim or run `:Lazy sync`

## See also

- [PLUGINS.md](../PLUGINS.md) — full plugin list
- [cheat.md](../cheat.md) — all keybinds (tmux + nvim + ghostty)