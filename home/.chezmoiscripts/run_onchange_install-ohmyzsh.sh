#!/bin/bash

sudo apt-get -y install zsh

CHSH='no' RUNZSH='no' sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s "$(which zsh)" "$USER"