#!/bin/bash
set -e

echo "started installation..."

case "$OSTYPE" in
  linux*)   bash "./software/linux/linux.sh";;
  *) echo "OS is not supported: $OSTYPE";;
esac

echo "finished installation"

source "./symlink.sh"

# zsh
