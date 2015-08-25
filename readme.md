# Xenite

## Note: this theme is no longer under development. Hopefully we (developers & contributors) will back on this theme soon, but not before the date of Elementary OS 0.4 release.

Xenite is a GTK theme created for [elementary OS Freya](http://elementary.io). Thanks to original [XGTK theme](http://kxmylo.deviantart.com/art/Xgtk-theme-gtk-3-14-3-12-465195148) as the base for this theme.
If you find a bug or want an improvement in any way, simply raise an issue and we'll be there. Xenite is licensed under MIT license.

# [Installation](https://github.com/eOS-themes/Xenite/wiki/Installation)
To install Xenite, simply run the following command:
```shell
sudo sh -c "curl https://raw.githubusercontent.com/eOS-themes/Xenite/master/setup/install.sh | bash"
```
If error similar to the following:-
```shell
bash: line 37: canal: readonly variable
bash: line 38: syntax error near unexpected token )' bash: line 38: [Ss]* )'
```
Then download the script and then run it in this way:-
```shell
$ bash
$ cd Downloads && curl https://raw.githubusercontent.com/eOS-themes/Xenite/master/setup/install.sh -O
$ chmod +x install.sh
$ sudo install.sh
```


# [Post-Install](https://github.com/eOS-themes/Xenite/wiki/Installation#post-install)
[We](https://github.com/eOS-themes/Xenite/graphs/contributors) recommend to use [GnomeYosemiteIcons](https://github.com/zacpier/GnomeYosemiteIcons) with installed [Numix Circle Icon Theme](https://github.com/numixproject/numix-icon-theme-circle).
You can simply install them using this command:
```shell
sudo sh -c "curl https://raw.githubusercontent.com/eOS-themes/Xenite/master/setup/post-install.sh | bash"
```

# [Uninstall](https://github.com/eOS-themes/Xenite/wiki/Installation#uninstall)
To remove Xenite completely from your computer, simply run the following command:
```shell
sudo sh -c "curl https://raw.githubusercontent.com/eOS-themes/Xenite/master/setup/uninstall.sh | bash"
```
The only thing, which currently isn't automated by the remove script, is the deletion of crontab entry. To solve this issue, the command/script will power up the crontab editor (`crontab -e`). Search for `@reboot /usr/share/themes/Xenite/setup/update.sh` and delete it.
