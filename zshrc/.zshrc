# avflo

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. See ~/.oh-my-zsh/custom/themes/minimal.zsh-theme
ZSH_THEME="minimal"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# ── Plugins ──────────────────────────────────────────────────────────
# Only load oh-my-zsh custom plugins that are actually installed, so a fresh
# machine doesn't print "plugin not found" warnings. The two custom plugins
# must be cloned separately (see ~/dotfiles/README.md install steps).
plugins=(git brew npm node history-substring-search)
[[ -d "$ZSH/custom/plugins/zsh-autosuggestions" ]]     && plugins+=(zsh-autosuggestions)
[[ -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]] && plugins+=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ── Aliases ──────────────────────────────────────────────────────────
alias zshconfig="nano ~/.zshrc"
alias clima="curl wttr.in"

# Disable % eof
unsetopt prompt_cr prompt_sp

# ── pfetch info ──────────────────────────────────────────────────────
export PF_INFO="ascii title os host kernel uptime pkgs memory"

# ── History ──────────────────────────────────────────────────────────
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# ── Editor defaults ──────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim

# ── Aliases ──────────────────────────────────────────────────────────
alias vim=nvim
alias venv="source .venv/bin/activate"
alias cpwd='pwd | tr -d "\n" | pbcopy'
alias cheat='nvim ~/dotfiles/cheat.md'
alias cl='clear'

# Modern CLI replacements
alias cat=bat
alias la="eza -la --icons --git"
alias lt="eza --tree --level=2 --long --icons --git"
alias l="eza -l --icons --git -a"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gre='git reset'
alias ggraph="git log --all --decorate --oneline --graph"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dx="docker exec -it"

# Functions
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# ── Fuzzy finder (fzf + fd) ─────────────────────────────────────────
command -v fzf >/dev/null && source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --exclude .git --exclude Library'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --exclude .git --exclude Library'

# ── Lazy-load nvm for faster shell startup ───────────────────────────
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }

# ── Lazy-load bun for faster shell startup (only if installed) ───────
[[ -d "$HOME/.bun" ]] && {
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  [ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
}

# ── Go (only if installed) ──────────────────────────────────────────
[[ -d /usr/local/go ]] && {
  export PATH="$PATH:/usr/local/go/bin"
  export GO111MODULE=on
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOPATH/bin"
}

# ── opencode (only if installed) ────────────────────────────────────
[[ -d "$HOME/.opencode" ]] && export PATH="$HOME/.opencode/bin:$PATH"

# ── pipx user bin (only if exists) ──────────────────────────────────
[[ -d "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin"

# ── zoxide (smart cd) ───────────────────────────────────────────────
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# ── Machine-local overrides (NOT synced via stow) ──────────────────
# Per-machine PATH additions, secrets, or host-specific aliases go in
# ~/.zshrc.local (a real file, not a symlink, and ignored by the dotfiles
# repo). On a new machine:
#   1. cp ~/dotfiles/zshrc/.zshrc.local.example ~/.zshrc.local
#   2. Edit it for this machine.
#   3. `exec zsh` (or open a new terminal).
# This guard makes the local file optional — shell still works if absent.
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local