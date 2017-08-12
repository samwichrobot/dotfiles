export SOURCE_DIR=$HOME/projects
eval "$($HOME/dotmatrix/hr/bin/hr init -)"

# Load custom aliases
source $HOME/.aliases.local

# Add node modules bin to path
export PATH=$PATH:node_modules/.bin
# RVM setup
export PATH="$PATH:$HOME/.rvm/bin"
