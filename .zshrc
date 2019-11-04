source $HOME/.aliases

plugins=(git node npm tmux docker github docker-compose docker-machine extract dotenv man copyfile kubectl cargo rust)
ZSH_THEME="cloud"

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export TMUX_TMPDIR=$HOME/tmp
export TMPDIR=$HOME/tmp
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export TERM=xterm-256color


source $HOME/.oh-my-zsh/oh-my-zsh.sh

# local config
FILE=~/.zshrc.local
if test -f "$FILE"; then
    source $FILE
fi

source $HOME/.cargo/env
