# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh plugins
plugins=(brew ruby rbenv vi-mode)

source $ZSH/oh-my-zsh.sh

for function in ~/.zsh/functions/*; do
  source $function
done

alias g="git"
alias vi="mvim -v"
alias vim="mvim -v"
alias be="bundle exec"
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"
alias hpr="hub pull-request -o"
alias wifi="networksetup -setairportpower en0 off; networksetup -setairportpower en0 on"

export EDITOR="mvim -v"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Library/Tex/texbin

eval "$(rbenv init -)"
