#! /bin/bash
# Automated Install Script for Xenite theme
# Copyright (C) vinctux (Jaka Smrekar), 2015

# Install Xenite's dependencies
echo "Installing dependencies . . ."
hash gtk2-engines-pixbuf 2>/dev/null || { sudo apt-get install gtk2-engines-pixbuf; }
hash git 2>/dev/null || { sudo apt-get install git; }
 
# Pull night source code to /usr/share/themes
echo "Cloning from source . . ."
[ -d "/usr/share/themes/Xenite" ] && { cd /usr/share/themes/Xenite; sudo git pull origin master; } || { cd /usr/share/themes; sudo git clone https://github.com/eOS-themes/Xenite.git; }

# Fix plank issue
sudo rm -rf /usr/share/plank/themes/Xenite/
sudo mkdir /usr/share/plank/themes/Xenite/
sudo cp -rf /usr/share/themes/Xenite/plank/* /usr/share/plank/themes/Xenite/

# Create CRON job
echo "Schedule a cronjob at every startup?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Creating CRON job . . ."; sudo /etc/crontab >> "@reboot root /usr/share/themes/Xenite/setup/update.sh"; echo "DONE WITH INSTALLING!"; break;;
        No ) echo "DONE WITH INSTALLING!"; exit;;
    esac
done
