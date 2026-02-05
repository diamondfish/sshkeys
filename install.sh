#!/bin/bash

set -e

APP_NAME="sshkeys"
REPO_URL="https://raw.githubusercontent.com/diamondfish/sshkeys/master"
INSTALL_PATH="/usr/local/bin/$APP_NAME"

echo "Installing $APP_NAME..."

# Download script
curl -fsSL "$REPO_URL/$APP_NAME" -o "$INSTALL_PATH"

# Make executable
chmod +x "$INSTALL_PATH"

# Verify installation
if command -v "$APP_NAME" >/dev/null 2>&1; then
  echo "✅ $APP_NAME installed successfully!"
else
  echo "❌ Installation failed. Please check permissions or internet connection."
  exit 1
fi
