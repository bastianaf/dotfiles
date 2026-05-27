# tmux (prefix: Ctrl+A)

## Quick reference (most used)

| Action | Keybind |
|--------|---------|
| Split vertical | `Ctrl+A` then `v` |
| Split horizontal | `Ctrl+A` then `s` |
| Navigate panes | `Ctrl+A` then `h/j/k/l` |
| Zoom pane (full screen toggle) | `Ctrl+A` then `z` |
| Next session | `Ctrl+A` then `)` |
| Previous session | `Ctrl+A` then `(` |
| Switch session (picker) | `Ctrl+A` then `s` |
| Next window | `Ctrl+A` then `n` |
| Previous window | `Ctrl+A` then `p` |
| Detach session | `Ctrl+A` then `d` |

## All panes

| Action | Keybind |
|--------|---------|
| Split vertical | `Ctrl+A` then `v` |
| Split horizontal | `Ctrl+A` then `s` |
| Navigate panes | `Ctrl+A` then `h/j/k/l` |
| Resize pane | `Ctrl+A` then `H/J/K/L` |
| Zoom pane (full screen toggle) | `Ctrl+A` then `z` |
| Close pane | `exit` or `Ctrl+D` |
| Scroll up / copy mode | `Ctrl+A` then `[` (j/k to scroll, v/V+y to select/yank) |

## All windows

| Action | Keybind |
|--------|---------|
| New window | `Ctrl+A` then `c` |
| Next window | `Ctrl+A` then `n` |
| Previous window | `Ctrl+A` then `p` |
| Go to window by number | `Ctrl+A` then `0-9` |
| Swap window left | `Ctrl+A` then `←` |
| Swap window right | `Ctrl+A` then `→` |
| Rename window | `Ctrl+A` then `,` |

## All sessions

| Action | Keybind / Command |
|--------|---------|
| Next session | `Ctrl+A` then `)` |
| Previous session | `Ctrl+A` then `(` |
| Switch session (picker) | `Ctrl+A` then `s` |
| Rename session | `Ctrl+A` then `$` |
| Detach session | `Ctrl+A` then `d` |
| New session | `tmux new -s name` |
| List sessions | `tmux ls` |
| Reattach session | `tmux attach -t name` |
| Kill session | `tmux kill-session -t name` |
| Kill all sessions | `tmux kill-server` |

## Other

| Action | Keybind / Command |
|--------|---------|
| Reload config | `Ctrl+A` then `r` |
| Toggle nested tmux | `F12` |
| List all keybinds | `Ctrl+A` then `?` |

# neovim (leader: Space)

## LazyVim keybind groups

Press `Space` and wait — **which-key** shows all options:

| Category | Prefix | Includes |
|----------|--------|---------|
| Find files | `Space f` | fuzzy find, recent, grep, buffers |
| Search | `Space s` | grep, word under cursor, search/replace |
| Git | `Space g` | blame, log, lazygit, diff |
| Code/LSP | `Space c` | actions, rename, diagnostics, format |
| Window | `Space w` | split, navigate, resize |
| Buffer/Tab | `Space b` | next, prev, close, pin |
| Debug | `Space d` | breakpoints, step, continue |
| UI toggles | `Space u` | explorer, terminal, outline |
| Session | `Space S` | save, load, restore |

## Custom keybinds (our additions)

| Action | Keybind |
|--------|---------|
| Copy absolute path | `Space c p` |
| Copy relative path | `Space c r` |
| Show diagnostics float | `Space D` |
| Open dashboard | `Space d a` |
| File browser (Oil) | `-` |
| Oil float window | `Space e` |
| Code diff (unstaged) | `Space r u` |
| Code diff (vs main) | `Space r m` |
| Code diff (vs HEAD~1) | `Space r h` |
| Open git remote (browser) | `Space g b` |
| Git line history | `Space g l` |
| Stage hunk | `Space h s` |
| Reset hunk | `Space h r` |
| Preview hunk | `Space h p` |
| Blame line | `Space h b` |
| Diff this | `Space h d` |

## neovim basics

| Action | Keybind |
|--------|---------|
| Save file | `:w` |
| Quit file (keep nvim) | `:bd` |
| Quit nvim | `:qall` |
| Force quit | `:q!` |

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

# dotfiles management

| Action | Command |
|--------|---------|
| Stow all configs | `cd ~/dotfiles && stow neovim tmux ghostty zshrc` |
| Edit cheat sheet | `cheat` (opens in nvim) |
| Push changes | `cd ~/dotfiles && git add -A && git commit -m "msg" && git push` |
| Pull changes | `cd ~/dotfiles && git pull` |