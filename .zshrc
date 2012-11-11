# Path to your oh-my-zsh configuration.
ZSH=$HOME/oh-my-zsh

ZSH_THEME="robbyrussell"

# oh-my-zsh plugins
plugins=(git ruby brew github gem heroku npm node osx rbenv redis-cli vi-mode)

source $ZSH/oh-my-zsh.sh

alias vi="mvim -v"
alias vim="mvim -v"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export NODE_PATH=/usr/local/lib/node_modules

eval "$(rbenv init -)"

. ~/z/z.sh
