plugins=(git node npm tmux docker github extract dotenv man copyfile stack)
ZSH_THEME="kolo"

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

source $HOME/.oh-my-zsh/oh-my-zsh.sh

autoload -U compinit && compinit
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
