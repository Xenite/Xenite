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
echo "#======================================================#"
echo "#     $THEME by $AUTHOR ($RELEASE) Uninstall Script    #"
echo "#======================================================#"

# Remove plank, icons, cursors, etc.
if [[ $1 == "--sys" || $1 == "" ]]; then
    [[ -d "/usr/share/plank/themes/$THEME" ]] && { sudo rm -rf /usr/share/plank/themes/$THEME; }
    [[ -d "/usr/share/icons/$THEME" ]] && { sudo rm -rf /usr/share/icons/$THEME; }
    # Remove source
    sudo rm -rf /usr/share/themes/$THEME
elif [[ $1 == "--user" ]]; then
    # TODO: Fixes for plank, icons and cursors for user-wide install.
    # Remove source
    rm -rf ~/.themes/$THEME
fi

echo "DONE WITH UNINSTALL!"
