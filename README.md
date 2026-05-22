# dotfiles

Personal configuration for neovim, tmux, ghostty, and zsh. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

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
brew install --cask font-jetbrains-mono-nerd-font
```

## Install

```bash
git clone https://github.com/bastianaf/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow neovim tmux ghostty zshrc
```

If `~/.zshrc` already exists on a new machine:
```bash
stow --adopt zshrc
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