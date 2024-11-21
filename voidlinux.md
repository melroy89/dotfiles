# Void Linux (XFCE)

[Void Linux](https://voidlinux.org/) is a general purpose operating system, based on the monolithic Linux kernel

## Packages

_Note:_ I'm using Void Linux XFCE version in this example, but it won't install all xfce4 plugins/packages by default. So those I miss are also included below.

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
  jq sq chrony gcc make cmake nano \
  mpv xfce4-whiskermenu-plugin 
```

_Hint:_ If you need the kernel headers as well, use the package: `linux6.6-headers-6.6.16_1` (You can use to find the correct package name: `xbps-query -Rs linux`).

### Enable services

Enable the services (the onces we just installed):

```sh
sudo ln -s /etc/sv/chronyd /var/service/
```

Manually build (or add to package manager myself?): warpinator, shutter, kazam, font-manager

_TODO:_ Test installing & setup pipewire + easyeffects.
