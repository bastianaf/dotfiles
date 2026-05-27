# dotfiles

Personal configuration for neovim, tmux, ghostty, and zsh. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

**Neovim is [LazyVim](https://www.lazyvim.org/)-based** with [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

## Structure

```
dotfiles/
├── neovim/.config/nvim/
├── tmux/.tmux.conf
├── ghostty/.config/ghostty/
├── zshrc/.zshrc
├── cheat.md
└── PLUGINS.md
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
stow neovim tmux ghostty zshrc
```

First nvim launch will auto-install all plugins via lazy.nvim.

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