# tmux (prefix: Ctrl+A)

| Action | Keybind |
|--------|---------|
| Split vertical | `Ctrl+A` then `v` |
| Split horizontal | `Ctrl+A` then `s` |
| Navigate panes | `Ctrl+A` then `h/j/k/l` |
| New window | `Ctrl+A` then `c` |
| Next/prev window | `Ctrl+A` then `n` / `p` |
| Swap window left/right | `Ctrl+A` then `←` / `→` |
| Close pane | `exit` or `Ctrl+D` |
| Detach session | `Ctrl+A` then `d` |
| Reattach | `tmux attach -t dev` |
| List sessions | `tmux ls` |
| Reload config | `Ctrl+A` then `r` |
| Kill tmux | `tmux kill-server` |
| Toggle nested tmux | `F12` |
| Copy mode | `Ctrl+A` then `[` (use v/V/C-v+y to select/yank) |

# neovim (leader: Space)

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
| Lazygit | `Space g g` |
| Git line history | `Space g l` |
| Open git remote | `Space g b` |
| Code diff (unstaged) | `Space r u` |
| Code diff (vs main) | `Space r m` |
| Code diff (vs HEAD~1) | `Space r h` |
| Copy absolute path | `Space c p` |
| Copy relative path | `Space c r` |
| Move between windows | `Ctrl+H/J/K/L` |
| Save file | `:w` |
| Quit | `:q` |

# ghostty

| Action | Keybind |
|--------|---------|
| Navigate splits | `Opt+H/J/K/L` |
| Create split left | `Opt+Shift+H` |
| Create split down | `Opt+Shift+J` |
| Create split up | `Opt+Shift+K` |
| Create split right | `Opt+Shift+L` |

# opencode workflow

1. opencode makes changes (left pane)
2. nvim auto-detects changes (or `:e` to reload)
3. `Space r u` — see what opencode changed (codediff)
4. `Space g g` — lazygit to review and commit