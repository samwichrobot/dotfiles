source $HOME/.aliases

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

plugins=(git node npm nyan tmux)
ZSH_THEME="ys"

export ZSH=/home/curiosity/.oh-my-zsh
export EDITOR=vim
export TERM=xterm-256color

source $HOME/.oh-my-zsh/oh-my-zsh.sh
