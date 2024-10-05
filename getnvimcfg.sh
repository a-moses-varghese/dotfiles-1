#!/bin/bash

# Step 1: Backup existing Neovim config
echo "Backing up current Neovim configuration..."
mkdir -p ~/backups9m/nvim && cp -r ~/.config/nvim/* ~/backups9m/nvim/

# Step 2: Remove the current Neovim configuration
echo "Removing current Neovim configuration..."
rm -rf ~/.config/nvim/*

# Step 3: Remove the .git folder from the cloned repository
echo "Removing .git folder from cloned repository..."
rm -rf ~/dotfiles-1/.git

# Step 4: Copy the Neovim config from the cloned repo to the Neovim config location
echo "Copying new Neovim configuration..."
cp -r ~/dotfiles-1/.config/nvim ~/.config

echo "Process complete!"
