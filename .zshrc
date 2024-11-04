export ZSH="$HOME/.oh-my-zsh"

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
