#! /bin/bash
# Automated Install Script for Xenite theme - stable
# Copyright (C) vinctux (Jaka Smrekar), 2015

RELEASE="0.1"

# Install Xenite's dependecies
hash gtk2-engines-pixbuf 2>/dev/null || { sudo apt-get install gtk2-engines-pixbuf; }

cd ~/
# Download latest stable release from github.com
wget https://github.com/eOS-themes/Xenite/releases/download/$RELEASE/Xenite.tar
# Extract to /usr/share/themes
tar -xvf ~/Xenite.tar
sudo mv ~/Xenite /usr/share/themes/
# Remove temporary release download
rm ~/Xenite.tar

echo "Done!"
