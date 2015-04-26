#! /bin/bash
# Automated Install Script for Xenite theme - night
# Copyright (C) vinctux (Jaka Smrekar), 2015

# Install Xenite's dependecies
hash gtk2-engines-pixbuf 2>/dev/null || { sudo apt-get install gtk2-engines-pixbuf; }
hash git 2>/dev/null || { sudo apt-get install git; }
 
# Pull night source code to /usr/share/themes
cd /usr/share/themes/
[ -d "/usr/share/themes/Xenite" ] && { cd ./Xenite; sudo git pull origin master; } || { sudo git clone https://github.com/eOS-themes/Xenite.git; }

echo "Done!"
