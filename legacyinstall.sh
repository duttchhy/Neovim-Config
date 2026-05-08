#!/bin/bash

set -e

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'

# Initial Setup file for new systems
gitpath=$(pwd)

rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim

# Setup Neovim config and link to linuxtoolbox
mkdir -p "$HOME/.vim/undodir"
mkdir -p "$HOME/.scripts"
ln -s "$gitpath/titus-kickstart" "$HOME/.config/nvim"
