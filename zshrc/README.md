# zshrc

## Core settings

| Feature | Details |
|---------|---------|
| Framework | oh-my-zsh with avflo theme |
| History | 100K entries, shared, deduplicated |
| Editor | `EDITOR=nvim`, `VISUAL=nvim` |
| nvm | Lazy-loaded (deferred until first use) |

## Aliases

| Alias | What it does |
|-------|-------------|
| `vim` | `nvim` |
| `venv` | `source .venv/bin/activate` |
| `cpwd` | Copy current directory to clipboard |
| `cheat` | Open cheat sheet in nvim |

## Fuzzy finder

fzf + fd integration:
- `Ctrl+T` — fuzzy file search
- `Ctrl+R` — fuzzy command history search

## Lazy nvm

nvm only loads when you first use `node`, `npm`, `npx`, or `nvm`. Shell startup is ~2s faster.