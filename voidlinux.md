# Void Linux (XFCE)

[Void Linux](https://voidlinux.org/) is a general purpose operating system, based on the monolithic Linux kernel

## Packages

```sh
sudo xbps-install -Su \
  0ad 0ad-data inkscape \
  papirus-icon-theme papirus-folders \
  htop mate-backgrounds x2goclient \
  keepassxc nextcloud-client element-desktop file-roller \
  telegram-desktop gimp peek \
  mumble chromium opera libreoffice \
  foliate xreader transmission tor \
  obs filezilla minicom wireshark \
  git php-fpm composer nginx mariadb phpMyAdmin \
  gpick vscode celluloid ghex gnome-calculator qalculate-gtk \
  jq sq chrony gcc make cmake
```

If you need the kernel headers as well, use: `linux6.6-headers-6.6.15_1` (And use: `xbps-query -Rs linux` to find the version you want to install).

### Enable services

Enable the services (the onces we just installed):

```sh
sudo ln -s /etc/sv/chronyd /var/service/
```

Manually build (or add to package manager myself?): warpinator, winegui, shutter, kazam

_TODO:_ Test installing & setup pipewire + easyeffects.
