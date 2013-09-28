# Path to your oh-my-zsh configuration.
ZSH=$HOME/oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh plugins
plugins=(brew git ruby gem osx rbenv vi-mode)

source $ZSH/oh-my-zsh.sh

for function in ~/.zsh/functions/*; do
  source $function
done

alias vi="mvim -v"
alias vim="mvim -v"
alias be="bundle exec"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export NODE_PATH=/usr/local/lib/node_modules

eval "$(rbenv init -)"
