#!/bin/bash
set -eufo pipefail

sudo apt update

# deps
deps=(
  curl
  wget
  git
  jq
  btop
  bat
  zsh
  ansible
  build-essential
  #fd-find
  #fzf
  #git-lfs
  #libfuse2
  #openssh-server
  #ripgrep
  #shellcheck
  #units
  #xclip
  #musl-tools
  #gdal-bin
  #libgeos-dev
  #libproj-dev
  #postgis
  #postgresql
  #qgis
)
for pkg in "${deps[@]}"; do
    if apt list --installed 2>/dev/null | grep -q "^$pkg/"; then
        echo "✓ $pkg уже установлен"
    else
        echo "📦 Устанавливаю $pkg..."
        sudo apt install -y "$pkg"
    fi
done
