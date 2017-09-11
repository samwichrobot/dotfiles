export SOURCE_DIR=$HOME/projects
eval "$($HOME/dotmatrix/hr/bin/hr init -)"

# Load custom aliases
source $HOME/.aliases.local

# Add node modules bin to path
export PATH=$PATH:node_modules/.bin

# RVM setup
export PATH="$PATH:$HOME/.rvm/bin"

# added by Anaconda3 4.4.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

# add home bin directory
export PATH="$PATH:$HOME/bin"

# Linux stuff
if [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
