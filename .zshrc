export SOURCE_DIR=$HOME/projects
eval "$($HOME/dotmatrix/hr/bin/hr init -)"

# Load custom aliases
source $HOME/.aliases.local

# Setup for go
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOPATH/bin
