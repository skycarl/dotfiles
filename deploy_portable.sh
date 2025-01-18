#!/bin/zsh

cp .tmux.conf ~
cp .portable_config ~

if [[ -n "$ZSH_VERSION" ]]; then
    RC_FILE=~/.zshrc
elif [[ -n "$BASH_VERSION" ]]; then
    RC_FILE=~/.bashrc
else
    RC_FILE=~/.profile
fi

SOURCE_LINE='if [ -f ~/.portable_config ]; then . ~/.portable_config; fi'
if ! grep -Fxq "$SOURCE_LINE" "$RC_FILE"; then
    echo "$SOURCE_LINE" >> "$RC_FILE"
fi

source "$RC_FILE"