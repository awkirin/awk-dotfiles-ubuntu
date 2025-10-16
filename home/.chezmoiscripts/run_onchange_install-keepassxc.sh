#!/bin/bash
set -euo pipefail

TOOL_NAME="keepassxc"
if command -v "${TOOL_NAME}" >/dev/null 2>&1; then
    echo "${TOOL_NAME} is already installed"
    return 0 2>/dev/null || exit 0
fi

sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update
sudo apt install keepassxc -y
