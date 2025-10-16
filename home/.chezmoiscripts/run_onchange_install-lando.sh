#!/bin/bash
set -euo pipefail

TOOL_NAME="lando"
if command -v "${TOOL_NAME}" >/dev/null 2>&1; then
    echo "${TOOL_NAME} is already installed"
    return 0 2>/dev/null || exit 0
fi

# deps
deps=(
  curl
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

sudo -u awkirin /bin/bash -c "$(curl -fsSL get.lando.dev/setup-lando.sh)" -- --yes
#lando shellenv --add