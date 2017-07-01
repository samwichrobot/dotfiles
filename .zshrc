export SOURCE_DIR=$HOME/projects
eval "$($HOME/dotmatrix/hr/bin/hr init -)"

# Load custom aliases
source $HOME/.aliases.local

# Setup for go
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOPATH/bin

# Add node modules bin to path
export PATH=$PATH:node_modules/.bin
# RVM setup
export PATH="$PATH:$HOME/.rvm/bin"
