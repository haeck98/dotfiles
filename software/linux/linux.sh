echo "Installing for Arch Linux"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [[ ! -z $(command -v pacman) ]] ; then
    echo "using pacman"
    source "$(dirname $0)/pacman.sh"
else
    echo "Can't determine package manager to use..."
    exit
fi

if [[ ! -e "$HOME/.nvm" ]]; then
    echo "Installing NVM, Node, NPM"

    # nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    # install stable node version
    nvm install stable
    nvm use stable
fi

# neovim dependencies
install "neovim"
install "python"
install "fzf"
npm i -g neovim tree-sitter

if [[ ! -e "~/.local/share/nvim/vscode-js-debug" ]]; then
    CURRENT_PWD_STORE=$(pwd)

    git clone https://github.com/microsoft/vscode-js-debug.git ~/.local/share/nvim/vscode-js-debug
    cd ~/.local/share/nvim/vscode-js-debug
    npm install --legacy-peer-deps
    npm run compile
    cd $CURRENT_PWD_STORE
fi

# tools
install "tmux"
install "alacritty"



echo "Finished installing"
