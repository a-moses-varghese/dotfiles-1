#!/bin/bash

# Define paths
SOURCE_DIRS=(
    "$HOME/.config/btop"
    "$HOME/.config/hypr"
    "$HOME/.config/kitty"
    "$HOME/.config/nvim"
    "$HOME/.config/waybar"
    "$HOME/.config/wofi"
)

# Define the source files
SOURCE_FILES=(
  "$HOME/.config/starship.toml"
#  "$HOME/.zshrc"
#   "$HOME/.config/file3.txt"
)

DESTINATION_DIR=~/Codespace/current/dotfiles-1/.config

# Loop through each source folder
for SOURCE_DIR in "${SOURCE_DIRS[@]}"; do
    FOLDER_NAME=$(basename "$SOURCE_DIR")
    TARGET_DIR="$DESTINATION_DIR/$FOLDER_NAME"

    # Delete the target folder if it exists
    if [ -d "$TARGET_DIR" ]; then
        echo "Deleting existing folder: $TARGET_DIR"
        rm -rf "$TARGET_DIR"
    else
        echo "No existing folder found at: $TARGET_DIR"
    fi

    # Copy the source folder to the destination
    echo "Copying folder from $SOURCE_DIR to $DESTINATION_DIR"
    cp -r "$SOURCE_DIR" "$DESTINATION_DIR"
done

# Loop through each file in the array and copy it to the destination
for file in "${SOURCE_FILES[@]}"; do
  cp "$file" "$DESTINATION_DIR"
done

# Optionally, print a success message
echo "All folders and files copied to $DESTINATION_DIR"
echo "Success!"
