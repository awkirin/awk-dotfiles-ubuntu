#!/bin/bash
set -euo pipefail

TOOL_NAME="google-chrome-stable"
if command -v "${TOOL_NAME}" >/dev/null 2>&1; then
    echo "${TOOL_NAME} is already installed"
    return 0 2>/dev/null || exit 0
fi


# deps
deps=(
  curl
  software-properties-common
  apt-transport-https
  ca-certificates
)
need_install=false
for pkg in "${deps[@]}"; do
    if ! dpkg -l | grep -q " $pkg "; then
        need_install=true
        break
    fi
done
if $need_install; then
    sudo apt update
    sudo apt install -y "${deps[@]}"
fi


if [[ ! -f "/usr/share/keyrings/google-chrome.gpg" ]]; then
  curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee "/usr/share/keyrings/google-chrome.gpg" > /dev/null
fi

if [[ ! -f "/etc/apt/sources.list.d/google-chrome.list" ]]; then
  echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee "/etc/apt/sources.list.d/google-chrome.list"
  sudo apt update
fi

sudo apt install "${TOOL_NAME}" -y
echo "${TOOL_NAME} installed"
