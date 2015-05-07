#! /bin/bash
# Automated Update Script for GTK themes
# Copyright (C) vinctux (Jaka Smrekar), 2015
# This file is part of gtkon (https://github.com/vinctux/gtkon/), a project licensed under the MIT license.
#
# gtkon v1.1

# Define your theme project name (GTKTheme),
# its author (AUTHOR), its git network address (GitURL) and
# the latest stable release (RELEASE) [if without releases leave empty].
# In case you're hosting on GitHub, change $GITHUB to 1 and provide your 
# username on which the project is hosted.
GTKTheme="Xenite"
AUTHOR="eOS-themes"
GitURL="https://github.com/eOS-themes/Xenite.git"
GITHUB=1
RELEASE=""

# Define how do you preffer that your GTK themes is distributed:
# canal='S' for stable releases / canal='N' for night builds
# Currently, stable distribution is availible only for GitHub repos.
canal="N"

read -p "Stable [S/s] release or night [N/n] (maybe unstable) build? " canal
case $canal in
    [Ss]* )
        echo "Download stable source. . ."
        if [ $GITHUB == 1 && $AUTHOR != "" && $RELEASE != ""]; then
            cd ~/
            wget https://github.com/$AUTHOR/$GTKTheme/releases/download/$RELEASE/$GTKTheme.tar
            tar -xvf ~/$GTKTheme.tar
            sudo mv ~/$GTKTheme /usr/share/themes/
            rm ~/$GTKTheme.tar
        fi
        [ $GITHUB == 0 ] && { echo "ERROR - Custom git stable releases (other than GitHub) are (currenlty) not supported."; }
        echo "DONE WITH STABLE INSTALL!"
        break;;
    [Nn]* )
        echo "Cloning from source . . ."
        cd /usr/share/themes/$GTKTheme
        sudo git pull origin master
        break;;
esac

# Fix plank issue (if existent)
if [ -d "/usr/share/themes/$GTKTheme/plank" ]; then
    sudo rm -rf /usr/share/plank/themes/$GTKTheme
    sudo mkdir /usr/share/plank/themes/$GTKTheme
    sudo cp -rf /usr/share/themes/$GTKTheme/plank/* /usr/share/plank/themes/$GTKTheme
fi

echo "DONE WITH UPDATING!"
