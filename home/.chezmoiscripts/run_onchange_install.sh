#!/bin/bash
set -eufo pipefail

echo "bat -------------------------------"
sudo apt install bat -y


#echo "ansible -------------------------------"
#sudo apt install ansible -y


echo "docker -------------------------------"
sudo -u awkirin sh -c "$(curl -fsSL get.docker.com)"

echo "lando -------------------------------"
sudo -u awkirin /bin/bash -c "$(curl -fsSL get.lando.dev/setup-lando.sh)" -- --yes
#lando shellenv --add

echo "jetbrains toolbox -------------------------------"
sudo -u awkirin /bin/bash -c "$(curl -fsSL raw.githubusercontent.com/awkirin/awk-snippets/master/linux/ubuntu/install-jetbrains-toolbox.sh)"

  # - | # xrdp
  # sudo apt install xrdp -y
  # if [[ ! -f "/etc/xrdp/xrdp.ini.bak" ]]; then
  #   sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
  # fi
  # sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
  # sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
  # sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini


  #   # sudo apt install ubuntu-desktop -y
  # sudo tee ~/.xsessionrc > /dev/null <<EOF
  # export GNOME_SHELL_SESSION_MODE=ubuntu
  # export XDG_CURRENT_DESKTOP=ubuntu:GNOME
  # export XDG_DATA_DIRS=/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop
  # export WAYLAND_DISPLAY=
  # export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
  # EOF

  #   sudo systemctl restart xrdp


# end
#sudo apt upgrade -y
#sudo apt autoremove -y
#sudo apt apt clean -y
#exit






