# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER=ian

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Disable shared history
unsetopt share_history

plugins=(git ruby docker)

## PATHS
###########################################################
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# My local shortcut scripts
export PATH="$HOME/bin:$PATH"

# export PATH="/usr/local/share/npm/bin:$PATH"

# Any project binstubs
export PATH="./bin:$PATH"

#export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# https://github.com/jimeh/tmuxifier
source "$HOME/dotfiles/tmuxifier/env.sh"

export PATH="$HOME/.tmuxifier/bin:$PATH"
source "$HOME/dotfiles/tmuxifier/env.sh"

# Brew
export PATH="/usr/local/sbin:$PATH"

# What the time Mr Wolf (but with better formatting)
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

export LC_ALL=en_US.utf-8

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export EDITOR='vim'
export BUNDLER_EDITOR=vim

# super vi mode! http://dougblack.io/words/zsh-vi-mode.html
bindkey -v

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ian/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

alias v="vagrant"
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"

export DOCKER_MACHINE_NAME=quiqupapi
eval "$(docker-machine env ${DOCKER_MACHINE_NAME})"
