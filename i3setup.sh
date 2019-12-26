#!/usr/bin/env bash

sudo -v

sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev xutils-dev libxcb-shape0-dev autoconf libxcb-xrm-dev -y
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
sudo apt-get install i3status dmenu
cd /tmp
git clone https://github.com/tryone144/compton
cd compton
make
sudo apt install pkg-config make gcc libev-libevent-dev libdbus-1-dev libgl1-mesa-dev libgles2-mesa-dev libxcb-present-dev libxcb-sync-dev libxcb-damage0-dev libx11-xcb-dev libev4 libev-dev uthash-dev libxdg-basedir-dev libconfig-dev meson libx11-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-shape0-dev libxcb-xkb-dev pkg-config xcb-proto libxcb-xrm-dev libxcb-composite0-dev xcb libxcb-ewmh2 libxcb1-dev libxcb-keysyms1-dev libxcb-util0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcomposite-dev libxrandr-dev libxinerama-dev -y
cd compton
make
sudo make MANPAGES= install
sudo apt-get install feh -y
cd ~/Downloads
curl -LO https://wallpaperplay.com/walls/full/9/3/2/126447.jpg
feh --bg-fill ~/Downloads/126447.jpg
