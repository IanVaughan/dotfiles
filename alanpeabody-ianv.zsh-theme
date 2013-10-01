
local pwd='%{$fg[green]%}%~%{$reset_color%}'
local ver=$(rbenv version | sed -e "s/ (set.*$//")
local rvm='%{$fg[green]%}v$ver%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
# local git_branch='$(git_prompt_status)%{$reset_color%} $(git_prompt_info)%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${pwd}$ "
RPROMPT="${return_code} ${git_branch} ${rvm}"
