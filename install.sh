#!/bin/bash

set -e

REPO_URL="https://raw.githubusercontent.com/diamondfish/sshkeys/master"
INSTALL_PATH="/usr/local/bin/sshkeys"

echo "Installing sshkeys..."

# Download script
curl -fsSL "$REPO_URL/sshkeys" -o "$INSTALL_PATH"

# Make executable
chmod +x "$INSTALL_PATH"

# Verify installation
if command -v sshkeys >/dev/null 2>&1; then
  echo "✅ sshkeys installed successfully!"
  echo ""
  echo "Usage: sshkeys [options] <directory>"
else
  echo "❌ Installation failed. Please check permissions or internet connection."
  exit 1
fi
