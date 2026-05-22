# dotfiles

Personal configuration files for neovim, tmux, ghostty, and zsh. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── neovim/.config/nvim/
├── tmux/.tmux.conf
├── ghostty/.config/ghostty/
└── zshrc/.zshrc
```

## Requirements

```bash
brew install stow neovim tmux fzf fd ripgrep lazygit lua-language-server tree-sitter glow
```

Install a Nerd Font (required for icons):

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

Set Ghostty's font to `JetBrainsMono Nerd Font` in its config.

## Install

```bash
git clone https://github.com/bastianaf/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow neovim
stow tmux
stow ghostty
stow zshrc
```

If `~/.zshrc` already exists on a new machine:

```bash
cd ~/dotfiles
stow --adopt zshrc   # brings existing .zshrc into the repo
```

## Adding a new config

1. Move the config into the dotfiles repo, mirroring the home directory structure
2. Run `stow <package>` to create the symlink
3. Commit and push

## Quick alias

```bash
cheat    # opens this cheat sheet in nvim (~/dotfiles/cheat.md)
```

---

## Neovim Configuration

A minimal hand-crafted config (~240 lines) using Neovim's built-in `vim.pack` package manager (no lazy.nvim or packer). Based on [Wout Vossen's pookie-dotfiles](https://github.com/vossenwout/pookie-dotfiles).

### Core settings

| Setting | Value |
|---------|-------|
| Leader key | `Space` |
| Line numbers | Relative + absolute |
| Search | Case-insensitive (smartcase) |
| Clipboard | Synced with system clipboard |
| Swap files | Disabled |
| Auto-format on save | Enabled (via LSP) |
| Theme | Kanagawa Wave (transparent gutters) |

### Plugins

| Plugin | What it does |
|--------|-------------|
| **fzf-lua** | Fuzzy finder for files, grep, buffers, LSP references (like VS Code's Cmd+P) |
| **blink.cmp** | Autocomplete with signature help as you type |
| **nvim-treesitter** | Syntax highlighting (better than regex) |
| **nvim-lspconfig** | Language server protocol — go-to-definition, diagnostics, auto-format |
| **mini.icons** | File/type icons everywhere (fzf-lua, oil, etc.) |
| **oil.nvim** | File browser that edits the filesystem like a buffer |
| **codediff.nvim** | VS Code-style diff view (vs unstaged, main, HEAD~1) |
| **lazygit.nvim** | Git UI inside neovim |
| **neoscroll.nvim** | Smooth scrolling animations |
| **alpha-nvim** | Start screen / dashboard |
| **render-markdown.nvim** | Pretty markdown rendering |
| **kanagawa.nvim** | Color theme |

### Keybinds

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
| Code diff (unstaged) | `Space r u` |
| Code diff (vs main) | `Space r m` |
| Code diff (vs HEAD~1) | `Space r h` |
| Copy absolute path | `Space c p` |
| Copy relative path | `Space c r` |
| Quit file (keep nvim) | `:bd` |

### LSP servers

Install any you need:

```bash
# Python
uv tool install ruff@latest

# Lua
brew install lua-language-server

# TypeScript (via npm)
npm i -g typescript-language-server typescript
```

Then add them to `vim.lsp.enable({})` in `init.lua`.

---

## tmux Configuration

| Setting | Value |
|---------|-------|
| Prefix key | `Ctrl+A` |
| Theme | Kanagawa |
| Splits | `v` (vertical), `s` (horizontal) |
| Pane nav | `h/j/k/l` |
| Copy mode | Vi-style (`v` select, `y` yank) |
| Nested session toggle | `F12` |
| Agent bell notifications | Enabled |

---

## Ghostty Configuration

| Setting | Value |
|---------|-------|
| Font | JetBrainsMono Nerd Font, size 14 |
| Theme | Kanagawa Wave |
| Split navigation | `Opt+H/J/K/L` |
| Create splits | `Opt+Shift+H/J/K/L` |
| Option key | Treated as Alt (`macos-option-as-alt`) |
| Cursor trail | Custom GLSL shader |
| Clipboard write | Allowed |

---

## Zsh Configuration

| Feature | Details |
|---------|---------|
| Framework | oh-my-zsh with avflo theme |
| Plugin manager | Built-in `vim.pack` (neovim) |
| Fuzzy finder | fzf + fd integration |
| nvm | Lazy-loaded (deferred until first use) |
| History | 100K entries, shared, deduplicated |
| Editor | `EDITOR=nvim` |
| Key aliases | `vim=nvim`, `venv=source .venv/bin/activate`, `cheat=nvim ~/dotfiles/cheat.md` |