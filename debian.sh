#!/usr/bin/env bash

sudo -v

sudo apt update

# Install zsh
sudo apt install zsh -y

# Install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug.git $ZPLUG_HOME

# Install fzf
sudo apt install fzf -y

# Install fasd
sudo apt install make unzip -y
mkdir fasd_tmp
cd fasd_tmp
curl -LO https://github.com/clvv/fasd/zipball/1.0.1
unzip -j 1.0.1
make install
cd ../
rm -rf fasd_tmp

sudo chsh -s $(which zsh)

export ZPLUG_AUTO=true
exec zsh
