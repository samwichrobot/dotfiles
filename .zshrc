plugins=(git node npm tmux docker github docker-compose docker-machine extract dotenv man copyfile kubectl cargo rust)
ZSH_THEME="ys"

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"

export TMUX_TMPDIR=$HOME/tmp
export TMPDIR=$HOME/tmp
export EDITOR=vim
export TERM=xterm-256color
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

source $HOME/.aliases
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# local config
FILE=~/.zshrc.local
if test -f "$FILE"; then
    source $FILE
fi

CARGO_ENV_FILE=$HOME/.cargo/env
if test -f "$CARGO_ENV_FILE"; then
    source $CARGO_ENV_FILE
fi
