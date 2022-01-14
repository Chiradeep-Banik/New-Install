#!/bin/sh
echo "Please enter the username"
read varuser
id -u $varuser > /dev/null
if [ $? -ne 0 ]; then
        echo "The user is not valid"
        exit -1
fi
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev \
               git wget xinit xorg xserver-xorg-dev xserver-xorg x11-xserver-utils \
               curl
    
cd /dwm-6.3/
make clean install
make clean
cd ../st-0.8.5
make clean install
make clean
cd ../dmenu-5.0
make clean install
make clean
