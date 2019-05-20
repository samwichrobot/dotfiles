source $HOME/.aliases

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"

plugins=(git node npm tmux docker github docker-compose docker-machine extract dotenv man copyfile)
ZSH_THEME="ys"

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export TERM=xterm-256color

source $HOME/.oh-my-zsh/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="/usr/local/opt/llvm/bin:$PATH"
