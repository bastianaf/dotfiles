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
brew install stow neovim tmux fzf fd ripgrep lazygit lua-language-server tree-sitter
```

## Install

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow neovim
stow tmux
stow ghostty
stow zshrc
```

## Adding a new config

1. Move the config into the dotfiles repo, mirroring the home directory structure
2. Run `stow <package>` to create the symlink
3. Commit and push