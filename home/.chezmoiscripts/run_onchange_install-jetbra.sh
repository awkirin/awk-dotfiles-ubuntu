#!/bin/bash
set -euo pipefail

sudo -u awkirin chmod +x "${HOME}/.local/share/jetbra/scripts/install.sh"
sudo -u awkirin "${HOME}/.local/share/jetbra/scripts/install.sh"
