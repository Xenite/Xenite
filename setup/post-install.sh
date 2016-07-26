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

THEME="Xenite"
AUTHOR="eOS-themes"
RELEASE="v0.7"

echo "themeon Setup Scripts v1.3 by Jaka Smrekar (vinctux), 2015-16"
echo
echo "#=========================================================#"
echo "#     $THEME by $AUTHOR ($RELEASE) Post-Install Script    #"
echo "#=========================================================#"

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
sudo sh -c "curl https://raw.githubusercontent.com/Foggalong/hardcode-fixer/master/fix.sh | sh"
curl https://raw.githubusercontent.com/zacpier/GnomeYosemiteIcons/master/download_from_github.sh | sh

########################
# End specifying here! #
########################
echo "DONE WITH POST-INSTALL!"
