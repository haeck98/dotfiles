export DOWNLOAD_DIR="$(realpath "$(dirname $0)")/../download"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# install stable node version
nvm install stable
nvm use stable

# neovim dependencies
npm i -g neovim tree-sitter
pacman -Sy python

pacman -Sy neovim

pacman -Sy tmux
pacman -Sy alacritty
