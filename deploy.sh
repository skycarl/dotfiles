#!/bin/zsh

cp .zshrc ~
cp .tmux.conf ~
cp .bash_aliases ~

# 1Password CLI setup
mkdir ~/.config/op
cp plugins.sh ~/.config/op/plugins.sh

source ~/.zshrc
