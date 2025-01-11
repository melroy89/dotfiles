# Linux Mint

[Linux Mint](https://linuxmint.com/) is a community-driven Linux distribution based on Ubuntu.

I either use Linux Mint XFCE Edition or the Cinnamon Edition.

## PPA packages

```sh
# Pipewire + wireplumber
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
sudo add-apt-repository ppa:pipewire-debian/wireplumber-upstream
# Inkscape
sudo add-apt-repository ppa:inkscape.dev/stable
# Peek
sudo add-apt-repository ppa:peek-developers/stable
# Shutter
sudo add-apt-repository ppa:shutter/ppa
# Kazam
sudo add-apt-repository ppa:sylvain-pineau/kazam
# 0Ad
sudo add-apt-repository ppa:wfg/0ad
# X2Go
sudo apt-add-repository ppa:x2go/stable
# Keepassxc
sudo add-apt-repository ppa:phoerious/keepassxc
# Papirus icons
sudo add-apt-repository ppa:papirus/papirus
# Nice collection of apps/games: https://xtradeb.net/category/play/
sudo add-apt-repository ppa:xtradeb/apps
# Wireshark
sudo add-apt-repository ppa:wireshark-dev/stable
# Git
sudo add-apt-repository ppa:git-core/ppa
# Ruby RVM
sudo add-apt-repository ppa:rael-gc/rvm
# PHP
sudo add-apt-repository ppa:ondrej/php
# Latest of the latest XFCE, thunar, catfish, tumbler from staging (can break your system)
sudo add-apt-repository ppa:xubuntu-dev/staging

# Trigger update
sudo apt-get update
```

## APT Packages

**Audio**

```sh
# Install libpipewire and wireplumber
sudo apt install libfdk-aac2 libldacbt-{abr,enc}2 libopenaptx0
sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,bin,locales,tests}}
sudo apt-get install wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev}
```

After pipewire is installed _disable pulseaudio_: `systemctl --user --now disable  pulseaudio.{socket,service} && systemctl --user mask pulseaudio`

And enable pipewire: `systemctl --user --now enable pipewire{,-pulse}.{socket,service}`

**Apps**

```sh
sudo apt install codium firefox wine win32:i386 wine64 filezilla peek kazam nginx fpm8.2-cli fpm8.2-fpm dnsutils lm-sensors vulkan-tools keepassxc shutter inkscape
```

**Games**

```sh
# Install 0ad
sudo apt install 0ad 0ad-data
```

## MySQL (MariaDB)

Before starting:

`mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql`

Set new root password, via:

`mysqladmin -u root password`

Finally:

```sh
systemctl start mariadb
systemctl enable mariadb
```

## Firewall rules (ufw)

Optionally configure firewall.

This is the graphical viewer (`gufw`):

![Firewall rules](firewall_rules.png)
