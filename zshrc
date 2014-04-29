# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"
#ZSH_THEME="gentoo"
#ZSH_THEME="simple"
#ZSH_THEME="smt"
# ZSH_THEME="wuffers"
#x ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
DEFAULT_USER=ian

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Disable shared history
unsetopt share_history

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

export PATH="./bin:$PATH"
#export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/jars"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.14.001/libexec"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export JAVA_HOME="$(/usr/libexec/java_home)"
export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"

# Whats the time Mr Wolf (but with better formatting)
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# My secrets
. ~/.zshrc-private

# Faster build times
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_GC_MALLOC_LIMIT=100000000

alias vim="mvim -v"

export LC_ALL=en_US.utf-8

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export EDITOR='vim'
export BUNDLER_EDITOR=vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# super vi mode! http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
