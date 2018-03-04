source $HOME/.aliases

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/usr/lib/go-1.9/bin"

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

plugins=(git node npm nyan tmux docker)
ZSH_THEME="ys"

export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export TERM=xterm-256color

source $HOME/.oh-my-zsh/oh-my-zsh.sh
