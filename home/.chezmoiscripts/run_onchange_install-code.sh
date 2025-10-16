#!/bin/bash
# https://code.visualstudio.com/docs/setup/linux
# sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/awkirin/awk-snippets/main/install-docker-engine.sh)"


set -eufo pipefail

# Install dependencies if missing
if ! command -v wget >/dev/null 2>&1 || ! command -v gpg >/dev/null 2>&1; then
    sudo apt update
    sudo apt install wget gpg apt-transport-https -y
fi

# Install Microsoft GPG key only if not present
if [ ! -f "/usr/share/keyrings/microsoft.gpg" ]; then
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
  rm -f microsoft.gpg
fi

# Add repository only if not present
if [ ! -f "/etc/apt/sources.list.d/vscode.sources" ]; then
  sudo tee "/etc/apt/sources.list.d/vscode.sources" > /dev/null <<EOF
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
  sudo apt update
fi

# Install VS Code if not installed
if ! command -v code >/dev/null 2>&1; then
    echo "Installing VS Code..."
    sudo apt install code -y
else
    echo "VS Code is already installed"
fi

echo "VS Code setup completed"
