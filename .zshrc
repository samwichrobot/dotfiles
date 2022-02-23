eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="half-life"

plugins=(git rust tmux node macos docker brew aws )

source $ZSH/oh-my-zsh.sh

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export PATH="/usr/local/opt/llvm/bin:$PATH"

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
