#!/bin/bash
set -e

echo "started installation..."

case "$OSTYPE" in
  linux*)   bash "./software/linux/linux.sh";;
  *) echo "OS is not supported: $OSTYPE";;
esac

echo "finished installation"

echo "stated symlinks..."

# symlink .zshrc
ln -f -s "$PWD/.zshrc" $HOME/.zshrc

# symlink nvim config
source "./nvim.sh"

echo "finished symlinks"

# zsh
