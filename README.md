# Xenite

# In development!
As [elementary OS](https://elementary.io/) [0.4 Loki](https://launchpad.net/elementaryos/0.4-loki) [Beta 2](https://elementary.io/developer) [is out](http://blog.elementary.io/post/147507276666/loki-beta-2-is-here), the development of the Xenite theme has been picked up again, as promised.

# Install
To install Xenite, install [`themeon`](https://github.com/vinctux/themeon) first.
```shell
cd ~
git clone https://github.com/vinctux/themeon.git
cd themeon
sudo make install
```
After successfully installing `themeon`, run the following to install Xenite. If you wish to install Xenite system-wide, replace `--user` with `--sys`.
```shell
themeon install --user https://raw.githubusercontent.com/Xenite/Xenite/master/Xenite.tconf a5961456887c159995e3e34e21848bb183a2360c66a9ce58a85730e43c897db7
```
In case of a hash mismatch error, report to [Xenite's Issues](https://github.com/Xenite/Xenite/issues). In case of other upstream script errors, file a bug at [`themeon`'s Issues](https://github.com/vinctux/themeon/issues). Keep in mind, that `themeon` is currently experimental software - failures can certainly happen. In case of a failure, report it, keep calm and stick with the [good ol' manual way](https://github.com/Xenite/Xenite/wiki/Install).

# Uninstall
To remove Xenite from your computer, simply run:
```shell
themeon remove Xenite
```
