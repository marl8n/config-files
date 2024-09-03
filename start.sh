#!/bin/bash

# Function to create symlink
create_symlink() {
  local source_file=$1
  local target_file=$2

  if [ -L "$target_file" ]; then
    echo "Symlink already exists: $target_file"
  elif [ -e "$target_file" ]; then
    echo "File already exists: $target_file. Skipping symlink."
  else
    ln -s "$source_file" "$target_file"
    echo "Symlink created: $target_file -> $source_file"
  fi
}

# Create necessary directories
mkdir -p ~/.config/tmux

# Move tmux configuration to ~/.config
if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.config/tmux/tmux.conf
  echo "Moved ~/.tmux.conf to ~/.config/tmux/tmux.conf"
fi

# Create symlink for tmux config
create_symlink ~/.config/tmux/tmux.conf ~/.tmux.conf

# Add any other configurations you'd like to set up here
# Example: Symlink Neovim config
# create_symlink ~/.config/nvim/init.lua ~/.vimrc

echo "Environment setup complete!"
