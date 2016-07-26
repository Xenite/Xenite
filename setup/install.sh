#! /bin/bash
# Automated Install Script for modern UNIX themes
# Copyright (C) vinctux (Jaka Smrekar), 2015-16
# This file is part of themeon (https://github.com/vinctux/themeon/), a project licensed under the MIT license.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# themeon v1.3

# Define your theme project name (THEME),
# its author (AUTHOR), its git network address (GITURL) and
# the latest stable release (RELEASE) [if without releases leave empty].
# In case you're hosting on GitHub, change GITHUB to 1, provide your 
# username on which the project is hosted (AUTHOR) and project theme name (THEME).
THEME="Xenite"
AUTHOR="eOS-themes"
GITURL="https://github.com/eOS-themes/Xenite.git"
GITHUB=1
RELEASE="v0.7"

# Define your custom (non-GitHub) release url under the following scheme:
#    RELEASEURL="http(s)://*.tld/*/$RELEASE/$THEME.tar"
# The release package must be a tarball archive.
RELEASEURL=""

# Define how do you prefer that your theme is distributed:
# CANAL="S" for stable releases / CANAL="N" for night builds
CANAL="N"

echo "themeon Setup Scripts v1.3 by Jaka Smrekar (vinctux), 2015-16"
echo
echo "#====================================================#"
echo "#     $THEME by $AUTHOR ($RELEASE) Install Script    #"
echo "#====================================================#"

# Install $THEME's dependencies
echo "Installing dependencies . . ."
dep=()
############################################################################################################
# List here all dependencies you want to install by this process.                                          #
# Scheme:  uncomment dep, replace Pkg1, Pkg2, etc. with dependencies or add additional dependency packages #
#          if no additional packages are needed, leave it as it is.                                        #
############################################################################################################
dep=(gtk2-engines-pixbuf)

for d in "${dep[@]}"
do
    :
    if [[ $(dpkg-query -W -f='${Status}' $d 2>/dev/null | grep -c "ok installed") -eq 0 ]]
    then
        sudo apt-get install $d -y
    fi
    echo $d
done

echo && echo "Done with installing dependencies!"

if [[ $1 == "--sys" || $1 == "" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo "System-wide install must be run as root." 2>&1
        exit 1
    fi
    # Pull stable or night build and put it into system-wide theme folder
    echo "Beginning with system-wide theme install . . ."
    read -p "Stable [S/s] release or night [N/n] (maybe unstable) build? " CANAL
    case $CANAL in
        [Ss]* )
            if [[ $GITHUB == 1 && $AUTHOR != "" && $RELEASE != "" && $RELEASE != "0" ]]; then
                echo "Downloading stable source from GitHub . . ."
                rm -f $THEME.tar
                wget https://github.com/$AUTHOR/$THEME/releases/download/$RELEASE/$THEME.tar -O /tmp/$THEME.tar -q
            elif [[ $GITHUB == 0 && $RELEASE != "" && $RELEASEURL != "" ]]; then
                echo "Downloading stable source from custom address . . ."
                wget $RELEASEURL -O /tmp/$THEME.tar -q
            else
                echo "Can't download stable build. Try again with night build."
                exit 1
            fi
            echo "Download complete!"
            echo "Extracting source archive . . ."
            tar -xvf /tmp/$THEME.tar
            echo "Archive extracted!"
            # Perform clean install
            [[ -d "/usr/share/themes/$THEME" ]] && { sudo rm -rf /usr/share/themes/$THEME; sudo mkdir /usr/share/themes/$THEME; }
            sudo mv /tmp/$THEME /usr/share/themes/
            echo "Cleaning up . . ."
            sudo rm -f /tmp/$THEME.tar
            sudo rm -rf /tmp/$THEME
            echo "DONE WITH STABLE PULL!"
            ;;
        [Nn]* )
            [[ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") ]] || { echo "Installing git . . ."; sudo apt-get install git -y; }
            echo "Cloning from git source . . ."
            [[ -d "/usr/share/themes/$THEME" ]] && { cd /usr/share/themes/$THEME; sudo git pull origin master; } || { cd /usr/share/themes; sudo git clone $GITURL; }
            echo "DONE WITH NIGHT PULL!"
            ;;
    esac

    # Fix plank issue (if existent)
    if [[ -d "/usr/share/themes/$THEME/plank" ]]; then
        echo "Placing 'plank' theme files into /usr/share/plank/themes/$THEME . . ."
        sudo rm -rf /usr/share/plank/themes/$THEME
        sudo mkdir /usr/share/plank/themes/$THEME
        sudo cp -rf /usr/share/themes/$THEME/plank/* /usr/share/plank/themes/$THEME
    fi

    # Fix icon issue (if existent)
    if [[ -d "/usr/share/themes/$THEME/icons" ]]; then
        echo "Placing 'icon' files into /usr/share/icons/$THEME . . ."
        sudo rm -rf /usr/share/icons/$THEME
        sudo mkdir /usr/share/icons/$THEME
        sudo cp -rf /usr/share/themes/$THEME/icons/* /usr/share/icons/$THEME
        [[ -d "/usr/share/themes/$THEME/icons/scalable" ]] && { [[ $(dpkg-query -W -f='${Status}' librsvg 2>/dev/null | grep -c "ok installed") -eq 0 ]] && { echo "Installing 'librsvg' for scalable icons . . ."; sudo apt-get install librsvg -y; }; }
    fi

    # Fix cursor issue (if existent)
    if [[ -d "/usr/share/themes/$THEME/cursors" ]]; then
        echo "Placing 'cursors' files into /usr/share/plank/themes/$THEME . . ."
        sudo rm -rf /usr/share/icons/$THEME/cursors
        sudo mkdir /usr/share/icons/$THEME/cursors
        sudo cp -rf /usr/share/themes/$THEME/cursors/* /usr/share/icons/$THEME/cursors
    fi
elif [[ $1 == "--user" ]]; then
    # Pull stable or night build and put it into user-wide theme folder
    echo "Beginning with user-wide theme install . . ."
    [[ -d "~/.themes/" ]] || { mkdir ~/.themes/; }
    read -p "Stable [S/s] release or night [N/n] (maybe unstable) build? " CANAL
    case $CANAL in
        [Ss]* )
            cd ~/
            if [[ $GITHUB == 1 && $AUTHOR != "" && $RELEASE != "" && $RELEASE != "0" ]]; then
                echo "Downloading stable source from GitHub . . ."
                rm -f $THEME.tar
                wget https://github.com/$AUTHOR/$THEME/releases/download/$RELEASE/$THEME.tar -O /tmp/$THEME.tar -q
            elif [[ $GITHUB == 0 && $RELEASE != "" && $RELEASEURL != "" ]]; then
                echo "Downloading stable source from custom address . . ."
                wget $RELEASEURL -O /tmp/$THEME.tar -q
            else
                echo "Can't download stable build. Try again with night build."
                exit 1
            fi
            echo "Download complete!"
            echo "Extracting source archive . . ."
            tar -xvf /tmp/$THEME.tar
            echo "Archive extracted!"
            # Perform clean install
            [[ -d "~/.themes/$THEME" ]] && { rm -rf ~/.themes/$THEME; mkdir ~/.themes/$THEME; }
            sudo mv /tmp/$THEME ~/.themes/
            echo "Cleaning up . . ."
            rm -f /tmp/$THEME.tar
            rm -rf /tmp/$THEME
            echo "DONE WITH STABLE PULL!"
            ;;
        [Nn]* )
            [[ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") ]] || { echo "Installing git . . ."; sudo apt-get install git -y; }
            echo "Cloning from git source . . ."
            [[ -d "~/.themes/$THEME" ]] && { cd ~/.themes/$THEME; git pull origin master; } || { cd ~/.themes/; git clone $GITURL; }
            echo "DONE WITH NIGHT PULL!"
            ;;
    esac

    # TODO: Fixes for plank, icons and cursors for user-wide install.
fi

# Activate [GTK] theme immediately
if [[ -d "/usr/share/themes/$THEME/gtk-2.0/" || -d "/usr/share/themes/$THEME/gtk-3.0/" || -d "~/.themes/$THEME/gtk-2.0/" || -d "~/.themes/$THEME/gtk-3.0/"]]; then
    read -p "Activate the [GTK 2+3] theme right now? [Y/N] " yn
    case $yn in
        [Yy]* ) echo "Activating [GTK] theme (via gsettings) . . ."; gsettings reset org.gnome.desktop.interface gtk-theme; gsettings reset org.gnome.desktop.wm.preferences theme; gsettings set org.gnome.desktop.interface gtk-theme "$THEME"; gsettings set org.gnome.desktop.wm.preferences theme "$THEME"; echo "DONE WITH ACTIVATING!";;
        [Nn]* ) ;;
    esac
fi
