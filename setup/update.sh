#! /bin/bash
# Automated Update CRON Script for Xenite theme
# Copyright (C) vinctux (Jaka Smrekar), 2015
 
# Pull night source code to /usr/share/themes/Xenite
echo "Cloning from source . . ."
cd /usr/share/themes/Xenite
sudo git pull origin master

# Fix plank issue
sudo rm -rf /usr/share/plank/themes/Xenite/
sudo mkdir /usr/share/plank/themes/Xenite/
sudo cp -rf /usr/share/themes/Xenite/plank/* /usr/share/plank/themes/Xenite/

echo "DONE WITH UPDATING!"
