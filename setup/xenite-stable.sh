#! /bin/bash
# Automated Install Script for Xenite theme - stable
# Copyright (C) vinctux (Jaka Smrekar), 2015

# Install Xenite's dependecies
hash gtk2-engines-pixbuf 2>/dev/null || { sudo apt-get install gtk2-engines-pixbuf; }
 
# Download latest stable release from github.com
curl -s -L https://github.com/eOS-themes/Xenite/releases/latest | egrep -o '/eOS-themes/Xenite/releases/download/[0-9]*/Xenite.tar' | wget --base=http://github.com/ -i - -O scollector
 
# Extract to /usr/share/themes
cd /usr/share/themes
sudo tar xzfU --overwrite --overwrite-dir ~/Xenite.tar
 
# Remove temporary release download
cd ~
rm Xenite.tar
