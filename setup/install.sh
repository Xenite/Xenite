#! /bin/bash
# Automated Install Script for Xenite theme - night
# Copyright (C) vinctux (Jaka Smrekar), 2015

# Install Xenite's dependencies
echo "Installing dependencies . . ."
hash gtk2-engines-pixbuf 2>/dev/null || { sudo apt-get install gtk2-engines-pixbuf; }
hash git 2>/dev/null || { sudo apt-get install git; }
 
# Pull night source code to /usr/share/themes
echo "Cloning from source . . ."
cd /usr/share/themes/
[ -d "/usr/share/themes/Xenite" ] && { cd ./Xenite; sudo git pull origin master; } || { sudo git clone https://github.com/eOS-themes/Xenite.git; }

# Fix plank
cd /usr/share/themes/Xenite
mkdir /usr/share/plank/themes/Xenite
sudo cp -rf ./plank/* /usr/share/plank/themes/Xenite/

# Clean up
echo "Cleaning up . . ."
cd /usr/share/themes/Xenite
sudo rm -rf ./plank
sudo rm -rf ./setup
sudo rm -f readme.md

echo "Done!"
