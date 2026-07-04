# Minimal prompt — vendor'd into dotfiles and stowed here.
# Layout (single line):
#   left:  "~ %# "
#   right: git branch when inside a repo, empty otherwise.

PROMPT='~ '
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="*"