#!/usr/bin/env bash

sudo -v

sudo apt update

# Install zsh
apt install zsh

# Install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug.git $ZPLUG_HOME

# Install fzf
sudo apt install fzf -y

# Install fasd
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt update
sudo apt install fasd

sudo chsh -s $(which zsh)

