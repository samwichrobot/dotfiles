# Load custom aliases
source $HOME/.aliases

# Add node modules bin to path
export PATH=$PATH:node_modules/.bin

# RVM setup
export PATH="$PATH:$HOME/.rvm/bin"

# added by Anaconda3 4.4.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

# add home bin directory
export PATH="$PATH:$HOME/bin"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export ZSH=/home/curiosity/.oh-my-zsh
plugins=(git bundler osx rake ruby node npm nyan tmux)
ZSH_THEME="ys"

export EDITOR=vim

source $HOME/.oh-my-zsh/oh-my-zsh.sh

export TERM=xterm-256color
