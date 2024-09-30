#!/bin/bash

bash ./software/nvm.sh
bash ./software/nvim.sh
bash ./software/tmux.sh

# symlink .zshrc
ln -f -s "$PWD/.zshrc" $HOME/.zshrc

# symlink nvim config
mkdir -p $HOME/.config
ln -f -s "$PWD/nvim/" $HOME/.config/

# zsh
