#!/usr/bin/env bash

sudo -v

sudo apt-get update

# Install zsh
sudo apt-get install zsh -y

# Install fzf and fasd
sudo apt-get install fzf -y
sudo apt-get install fasd -y

sudo chsh -s $(which zsh)

exec zsh
