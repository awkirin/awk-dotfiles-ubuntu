#!/bin/bash
set -euo pipefail

TOOL_NAME="brew"
if command -v "${TOOL_NAME}" >/dev/null 2>&1; then
    echo "${TOOL_NAME} is already installed"
    return 0 2>/dev/null || exit 0
fi

# deps
deps=(
  build-essential
  gcc
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

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo >> /home/awkirin/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/awkirin/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"