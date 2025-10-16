#!/bin/bash
set -eufo pipefail

# deps
deps=(
  "curl"
  "wget"
  "git"
  "jq"
  "btop"
  "bat"
  "zsh"
  "ansible"
  "build-essential"
  "fd-find"
  "fzf"
  "git-lfs"
  "libfuse2"
  "openssh-server"
  "ripgrep"
  "shellcheck"
  "units"
  "xclip"
  "musl-tools"
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
