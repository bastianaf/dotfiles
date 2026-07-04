# tmux

## Core settings

| Setting | Value |
|---------|-------|
| Prefix key | `Ctrl+A` |
| Theme | Catppuccin Mocha |
| Terminal | `tmux-256color` |

## Keybinds (prefix: Ctrl+A)

| Action | Keybind |
|--------|---------|
| Split vertical | `v` |
| Split horizontal | `s` |
| Navigate panes | `h/j/k/l` |
| New window | `c` |
| Next/prev window | `n` / `p` |
| Next/prev session | `)` / `(` |
| Switch session (picker) | `s` |
| Detach session | `d` |
| Reload config | `r` |
| List keybinds | `?` |
| Zoom pane toggle | `z` |
| Copy mode | `[` (then v/V+y to select/yank) |
| Nested session toggle | `F12` |

## Plugins

- **tmux-sensible** — sane defaults
- **vim-tmux-navigator** — seamless Ctrl+H/J/K/L between tmux and neovim panes

## Agent bell notifications

Visual bell indicator when a process in a background window finishes (useful with opencode).