#!/bin/sh

mkdir -p ~/.local/src/sxiv
git clone https://github.com/muennich/sxiv ~/.local/src/sxiv
cd ~/.local/src/sxiv
patch --merge -i ~/.config/sxiv/hokeys.patch main.c
make
sudo make install
