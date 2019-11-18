#!/usr/bin/env bash

sudo -v

sudo apt update

# Install zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install zplug
sudo apt install zplug -y

# Install fzf
sudo apt install fzf -y

# Install fasd
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt update
sudo apt install fasd

