#!/bin/bash
set -euo pipefail

if [[ -n $(command -v docker) ]]; then
    echo "Docker is already installed"
    exit 0
fi

# deps
deps=(
  curl
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


# Add Docker's official GPG key:
if [[ ! -f "/etc/apt/keyrings/docker.asc" ]]; then
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o "/etc/apt/keyrings/docker.asc"
  sudo chmod a+r "/etc/apt/keyrings/docker.asc"
fi


# Add the repository to Apt sources:
if [[ ! -f "/etc/apt/sources.list.d/docker.list" ]]; then
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee "/etc/apt/sources.list.d/docker.list" > /dev/null
  sudo apt-get -y update
fi


# Install the Docker packages.
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

if ! getent group docker >/dev/null; then
    sudo groupadd docker
fi

sudo usermod -aG docker "${USER}"

echo "Docker installed"
