# avflo

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="avflo/avflo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting git bundler colorize brew zeus gem rails ruby npm node history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nano ~/.zshrc"
alias clima="curl wttr.in"
alias pescao="asciiquarium"
alias win="cd /mnt/c"
alias ggraph="git log --all --decorate --oneline --graph"
#alias air='~/.air'

#Disable % eof
unsetopt prompt_cr prompt_sp

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export PF_INFO="ascii title os host kernel uptime pkgs memory"

#Go
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
export GOPATH=$HOME/go;
export PATH=$PATH:$GOPATH/bin;

cd ~

# Created by `pipx` on 2024-06-01 00:42:37
export PATH="$PATH:$HOME/.local/bin"

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

nvm() {
  _load_nvm
  nvm "$@"
}

node() {
  _load_nvm
  node "$@"
}

npm() {
  _load_nvm
  npm "$@"
}

npx() {
  _load_nvm
  npx "$@"
}

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Obsidian - PUT THIS AT THE END
export PATH="/Applications/Obsidian.app/Contents/MacOS:$PATH"


# opencode
export PATH=$HOME/.opencode/bin:$PATH
