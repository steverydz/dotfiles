#!/bin/bash

set -e

declare -a dotfiles=(
  ".gitconfig"
  ".gitignore"
  ".tmux.conf"
  ".vimrc"
)

for item in ${dotfiles[@]}; do
  rm -rf ~/$item
  ln -s ~/.dotfiles/$item ~/$item
done
