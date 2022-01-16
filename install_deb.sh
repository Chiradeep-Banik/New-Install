#!/bin/sh

echo "This is the installation script....\n"

echo "Installing the softwares using apt\n"
sudo apt -y install build-essential libx11-dev libxinerama-dev libxft-dev \
               git wget xinit xorg xserver-xorg-dev xserver-xorg x11-xserver-utils \
               curl compton feh vim alsa-utils trash-cli

echo "Copied the bashrc, vimrc and xinitrc\n"
cp .bashrc ~/.bashrc
cp .vimrc ~/.vimrc
cp .xinitrc ~/.xinitrc

echo "Installed vim plug\n"
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Adding the wallpaper"
mkdir ~/Pictures
cp batman-dark.jpg ~/Pictures/

echo "Make the suckless directory\n"
cd ~
mkdir suckless
cd suckless

#DWM -- Tiling window manager
echo "Starting dwm\n"
git clone git://git.suckless.org/dwm
cd dwm
sudo make clean
sudo make clean install
cd ..

# ST -- simple terminal
echo "Starting st\n"
git clone https://github.com/Chiradeep-Banik/st.git
cd st
sudo make clean
sudo make clean install
cd ..

# dmenu -- application launcher
echo "Starting dmenu\n"
git clone https://github.com/Chiradeep-Banik/dmenu.git
cd dmenu
sudo make clean
sudo make clean install
cd ..

# slstatus -- status bar modifier
echo "Starting slstatus\n"
git clone https://github.com/Chiradeep-Banik/slstatus.git
cd slstatus
sudo make clean
sudo make clean install
cd ~
