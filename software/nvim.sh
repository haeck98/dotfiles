#!/bin/bash

export NVIM_VERSION=v0.10.0

export DOWNLOAD_DIR="$(realpath "$(dirname $0)")/../download"

yay -Sy neovim=0.10
