plugins=(git node npm tmux docker github docker-compose docker-machine extract dotenv man copyfile kubectl)
ZSH_THEME="lambda"

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"

export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

source $HOME/.oh-my-zsh/oh-my-zsh.sh

autoload -U compinit && compinit
