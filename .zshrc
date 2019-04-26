source $HOME/.aliases

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"

plugins=(git node npm tmux docker github docker-compose docker-machine extract dotenv man copyfile)
ZSH_THEME="ys"

export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export TERM=xterm-256color

source $HOME/.oh-my-zsh/oh-my-zsh.sh
