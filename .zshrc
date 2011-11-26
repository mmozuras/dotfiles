# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git ruby brew github gem heroku npm node osx rails3)

source $ZSH/oh-my-zsh.sh

alias vi='mvim -v'
alias vim='mvim -v'

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/mindaugasmozuras/.rvm/bin

[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm
