#!/bin/zsh

TARGET_DIR="/opt/todoist"
LINK="/usr/local/bin/todoist"

# Find the latest .AppImage file inside the directory
TARGET=$(ls -t "$TARGET_DIR"/*.AppImage 2>/dev/null | head -n 1)

# Ensure a file was found
if [[ -z "$TARGET" ]]; then
  # echo "Error: No .AppImage file found in $TARGET_DIR."
  exit 1
fi

# Remove existing symlink if it exists
if [[ -L "$LINK" || -f "$LINK" ]]; then
  # echo "Removing existing $LINK..."
  sudo rm -f "$LINK"
fi

# Create a new symlink
# echo "Creating symbolic link from $TARGET to $LINK..."
sudo ln -s "$TARGET" "$LINK"

# Verify success
if [[ -L "$LINK" ]]; then
  # echo "Success: $LINK now links to $TARGET"
else
  # echo "Error: Failed to create the symbolic link."
  exit 1
fi
