eval "$(starship init zsh)"

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

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit | xargs chmod g-w
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
