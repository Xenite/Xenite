#! /bin/bash
# Automated Uninstall Script for GTK themes
# Copyright (C) vinctux (Jaka Smrekar), 2015
# This file is part of gtkon (https://github.com/vinctux/gtkon/), a project licensed under the MIT license.
#
# gtkon v1.1

GTKTheme="Xenite"

# Uninstall Xenite's dependencies (including git)
echo "Uninstalling dependencies . . ."
###################################################################################################
# Replace '$AddtionalDependencies' in accordance with below scheme.                               #
# Scheme: hash $DependencyPackage 2>/dev/null && { sudo apt-get remove $DependencyPackage; }      #
###################################################################################################
while true; do
    read -p "Remove $GTKTheme's dependencies (including git)? " yn
    case $yn in
        [Yy]* ) echo "Uninstalling $GTKTheme's dependencies (including git) . . ."; hash gtk2-engines-pixbuf 2>/dev/null && { sudo apt-get remove gtk2-engines-pixbuf; }; sudo apt-get remove git;  break;;
        [Nn]* ) echo "DONE WITH UNINSTALLING!"; break;;
        * ) break;;
    esac
done

# Remove source
sudo rm -rf /usr/share/themes/$GTKTheme
[ -d "/usr/share/themes/$GTKTheme/plank" ] && { sudo rm -rf /usr/share/plank/themes/$GTKTheme; }

echo "MANUALLY DELETE THE FOLLOWING CRONTAB ENTRY:"
echo "       @reboot /usr/share/themes/$GTKTheme/setup/update.sh"
crontab -e

echo "DONE WITH UNINSTALL!"
