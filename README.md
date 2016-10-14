# Xenite

### Note

This theme is not under development anymore. I don't want to develop themes, nor I want to change elementary OS style. I promised I'll back on it once Loki is out, but I decided to stop any work on it. Sorry. The `development` branch contains a theme that I wanted to create, the `master` branch contains an outdated default theme with OSX-like window controls. Feel free to fork it.

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
