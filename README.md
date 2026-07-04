# dotfiles

Personal configuration for neovim, tmux, ghostty, and zsh. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

**Neovim is [LazyVim](https://www.lazyvim.org/)-based** with [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

## Structure

```
dotfiles/
├── herdr/.config/herdr/
├── neovim/.config/nvim/
├── tmux/.tmux.conf
├── ghostty/.config/ghostty/
├── zshrc/.zshrc
├── zshrc/.zshrc.local.example
├── zshrc/.oh-my-zsh/custom/themes/minimal.zsh-theme
├── cheat.md
└── PLUGINS.md
```

## Machine-local shell config (NOT synced)

`~/.zshrc.local` is an optional real file (not a symlink, gitignored) sourced
at the end of `~/.zshrc` for per-machine PATH, secrets, or aliases. A template
is provided at `zshrc/.zshrc.local.example`:

```bash
cp ~/dotfiles/zshrc/.zshrc.local.example ~/.zshrc.local
# edit ~/.zshrc.local for this machine, then `exec zsh`
```

## Requirements

```bash
brew install stow neovim tmux fzf fd ripgrep lazygit lua-language-server glow ruff
brew install TheZoraiz/ascii-image-converter/ascii-image-converter
brew install --cask font-jetbrains-mono-nerd-font
```

## Install

```bash
git clone https://github.com/bastianaf/dotfiles.git ~/dotfiles
cd ~/dotfiles

# oh-my-zsh custom plugins (required for autosuggestions + syntax highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions     "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

stow neovim tmux ghostty herdr zshrc

# Optional: create ~/.zshrc.local from the template (see above)
cp ~/dotfiles/zshrc/.zshrc.local.example ~/.zshrc.local

herdr server reload-config   # apply prefix=ctrl+a live
```

First nvim launch will auto-install all plugins via lazy.nvim. After
bootstrapping, run `:Lazy sync` and `:Mason` in neovim to install the extras'
LSPs/formatters/linters (incl. `marksman` for markdown).

If `~/.zshrc` already exists:
```bash
stow --adopt zshrc
```

## Updating plugins

```
:Lazy sync    # inside nvim
```

## Adding a new config

1. Move the config into the dotfiles repo, mirroring `$HOME` structure
2. Run `stow <package>` to create the symlink
3. Commit and push

## Quick reference

```bash
cheat    # opens cheat sheet in nvim
```

See each folder's README for detailed config docs.