export ZSH="/Users/$(whoami)/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git rust docker brew)

source $ZSH/oh-my-zsh.sh

# Link to local zshrc file
LOCAL_ZSHRC_FILE=~/.zshrc.local
if [ -f "$LOCAL_ZSHRC_FILE" ]; then
    source $LOCAL_ZSHRC_FILE
fi

# Link to alias file
ALIAS_FILE=~/.alias
if [ -f "$ALIAS_FILE" ]; then
    source $ALIAS_FILE
fi
