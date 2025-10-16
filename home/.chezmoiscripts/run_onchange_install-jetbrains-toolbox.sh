#!/bin/bash
set -euo pipefail

# https://data.services.jetbrains.com/products/download?platform=linux&code=TBA

#apt install libfuse2 -y

TBA_LOCAL_BIN="${HOME}/.local/bin"
TBA_TMP_DIR="/tmp/jetbrains/tba"
TBA_INSTALL_DIR="${HOME}/.local/share/JetBrains/Toolbox/bin"

if [[ $EUID -eq 0 ]]; then
    echo  "This script should not be run as root"
    exit 1
fi

if [[ -d "${TBA_INSTALL_DIR}" ]]; then
    echo "✅ JetBrains Toolbox уже установлен в: ${TBA_INSTALL_DIR}"
    exit 0
fi

TBA_DATA=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true")
TBA_DATA_LINK=$(echo "${TBA_DATA}" | grep -oP '"linux":\s*{"link":"\K[^"]+')
TBA_DATA_FILENAME=$(basename "${TBA_DATA_LINK}")

echo "tba download"
mkdir -p "${TBA_TMP_DIR}"
wget -q --show-progress -cO "${TBA_TMP_DIR}/${TBA_DATA_FILENAME}" "${TBA_DATA_LINK}"

echo "tba install"
mkdir -p "${TBA_INSTALL_DIR}"
tar -xzf "${TBA_TMP_DIR}/${TBA_DATA_FILENAME}" -C "${TBA_INSTALL_DIR}" --strip-components=2

echo "tba bin"
mkdir -p "${TBA_LOCAL_BIN}"
ln -s "${TBA_INSTALL_DIR}/jetbrains-toolbox" "${TBA_LOCAL_BIN}/jetbrains-toolbox"
