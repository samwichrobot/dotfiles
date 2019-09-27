source $HOME/.aliases

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"

plugins=(git node npm tmux docker github docker-compose docker-machine extract dotenv man copyfile kubectl)
ZSH_THEME="ys"

export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export TERM=xterm-256color

source $HOME/.oh-my-zsh/oh-my-zsh.sh

export PATH="/usr/local/opt/llvm/bin:$PATH"

# work config
FILE=~/.influxenv
if test -f "$FILE"; then
    source $FILE
fi

export PATH="/usr/local/opt/llvm/bin:$PATH"
