#!/bin/bash
set -eufo pipefail

# deps
deps=(
  "ansible"
  "bat"
  "build-essential"
  "curl"
  "fd-find"
  "fzf"
  "git"
  "git-lfs"
  "jq"
  "libfuse2"
  "openssh-server"
  "ripgrep"
  "shellcheck"
  "units"
  "btop"
  "xclip"
  "musl-tools"
  "zsh"
  "gdal-bin"
  "libgeos-dev"
  "libproj-dev"
  "postgis"
  "postgresql"
  "qgis"
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
