#!/bin/zsh

create_symlink() {
    local file=$1
    local target=$2

    if [ -e "$target" ]; then
        echo "$target already exists"
    else
        ln -s "$file" "$target"
        echo "Created symlink for $file"
    fi
}

config_files=(
    ".zshrc"
    ".tmux.conf"
    ".gitconfig"
    ".portable_config"
)

# Create symlinks for config files
for file in "${config_files[@]}"; do
    create_symlink "$HOME/repos/dotfiles/$file" "$HOME/$file"
done

# 1Password CLI setup
mkdir -p ~/.config/op
create_symlink "$HOME/repos/dotfiles/plugins.sh" "$HOME/.config/op/plugins.sh"

source ~/.zshrc