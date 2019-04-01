source $HOME/.aliases

export PATH=$PATH:node_modules/.bin
export PATH="$PATH:$HOME/bin"

export GOPATH=$HOME/go
export PATH="$PATH:/usr/local/opt/go@1.11/libexec/bin/"
export PATH="$PATH:$GOPATH/bin"

plugins=(yarn git node npm tmux docker go golang github docker-compose docker-machine extract aws dotenv man kubectl copyfile)
ZSH_THEME="ys"

export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export TERM=xterm-256color

source $HOME/.oh-my-zsh/oh-my-zsh.sh
export GO111MODULE=on

alias weather-oakland='curl -4 http://wttr.in/Oakland'
alias weather-sf='curl -4 http://wttr.in/SanFrancisco'
alias moon='curl -4 http://wttr.in/Moon'

alias cat=bat
