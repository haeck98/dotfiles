export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME="robbyrussell"

plugins=(
    git
    colorize
    npm
    node
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export CHROME_EXECUTABLE=chrome

export LANG=de_DE.UTF-8

if [ -f "/home/haeck98/.deno/env" ]; then
    . "/home/haeck98/.deno/env"
fi

# open CWD if opened by a new Windows Terminal Tab
chpwd() {
    [[ -n "$WT_SESSION" ]] && {
        echo -en '\e]9;9;"'
        wslpath -w "$PWD" | tr -d '\n'
        echo -en '"\x07'
    }
}

fzcd() {
    # get arguments
    local start_dir="${1:-.}"  # Default to current directory if no argument is given

    cd "$(fzd $start_dir)"
}

fzd() {
    local start_dir="${1:-.}"  # Default to current directory if no argument is given

    fd --type d --hidden --exclude .git --ignore-file .gitignore . "$start_dir" | fzf
}
