#! /bin/bash
# Automated Post-Install Script for GTK themes
# Copyright (C) vinctux (Jaka Smrekar), 2015
# This file is part of gtkon (https://github.com/vinctux/gtkon/), a project licensed under the MIT license.
#
# gtkon v1.1

##################################################
# Specify additional recommended software below! #
##################################################

# Numix Circle Icon Theme
echo "Installing 'Numix Circle Icon Theme' . . ."
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle

# GnomeYosemiteIcons
echo "Installing GnomeYosemiteIcons . . ."
sudo sh -c "curl https://raw.githubusercontent.com/Foggalong/hardcode-fixer/master/fix.sh | bash"
curl https://raw.githubusercontent.com/zacpier/GnomeYosemiteIcons/master/download_from_github.sh | sh

########################
# End specifying here! #
########################
echo "DONE WITH POST-INSTALL!"
