#!/bin/bash
set -euo pipefail

SCRIPT_USER="${SCRIPT_USER:-"awkirin"}"

# deps
deps=(
  curl
  zsh
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

sudo -u "${SCRIPT_USER}" sh -c "$(curl -fsSL install.ohmyz.sh)" "" --unattended
