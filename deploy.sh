#!/bin/zsh

cp .zshrc ~
cp .tmux.conf ~
cp .bash_aliases ~
cp .gitconfig ~

# 1Password CLI setup
mkdir -p ~/.config/op
cp plugins.sh ~/.config/op/plugins.sh

source ~/.zshrc
