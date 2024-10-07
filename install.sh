#!/bin/bash
set -e

export DOWNLOAD_DIR="$(realpath "$(dirname $0)")/../download"

echo "started installation..."

case "$OSTYPE" in
  linux*)   bash "./software/linux/linux.sh";;
  *) echo "OS is not supported: $OSTYPE";;
esac

echo "finished installation"

source "./symlink.sh"

# zsh
