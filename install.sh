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
mkdir -p $HOME/.config
ln -f -s "$PWD/nvim/" $HOME/.config/

echo "finished symlinks"

# zsh
