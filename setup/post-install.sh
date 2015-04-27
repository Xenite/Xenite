#! /bin/bash
# Post-Install Script for Xenite theme
# Copyright (C) vinctux (Jaka Smrekar), 2015

# Numix Circle Icon Theme
echo "Installing 'Numix Circle Icon Theme' . . ."
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle

# GnomeYosemiteIcons
echo "Installing GnomeYosemiteIcons . . ."
sudo sh -c "curl https://raw.githubusercontent.com/Foggalong/hardcode-fixer/master/fix.sh | bash"
curl https://raw.githubusercontent.com/zacpier/GnomeYosemiteIcons/master/download_from_github.sh | sh

echo "DONE WITH POST-INSTALL!"
