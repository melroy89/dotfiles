# Linux Mint

[Linux Mint](https://linuxmint.com/) is a community-driven Linux distribution based on Ubuntu.

I either use Linux Mint XFCE Edition or the Cinnamon Edition.

## PPA packages

```sh
# Nextcloud desktop
sudo add-apt-repository ppa:nextcloud-devs/client
# Inkscape
sudo add-apt-repository ppa:inkscape.dev/stable
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

# Trigger update
sudo apt update
```

**Codium:**

```sh
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
```

**Floorp:**

```sh
curl -fsSL https://ppa.floorp.app/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list "https://ppa.floorp.app/Floorp.list"
sudo apt update && sudo apt install floorp
```

**Element chat:**

```sh
sudo apt install -y wget apt-transport-https
‍sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
‍echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update && sudo apt install element-desktop
```

**NodeJS:**

```sh
sudo apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs
```

**Bruno:**

```sh
sudo mkdir -p /etc/apt/keyrings 
sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/bruno.gpg --keyserver keyserver.ubuntu.com --recv-keys 9FA6017ECABE0266 
echo "deb [signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list 
sudo apt update && sudo apt install bruno
```

**Docker:**

```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## APT Packages

Software hat I install, which is not installed by default (be sure to add the PPAs above, if needed):

```sh
sudo apt install htop btop iotop iftop iperf3 git zsh gparted \
nvme-cli smartmontools  minicom neovim autokey-gtk \
mumble nemo-nextcloud gimp inkscape nvtop peek \
foliate codium nextcloud-desktop wireshark filezilla \
wine kazam nginx php8.4-cli php8.4-fpm dnsutils \
vulkan-tools ghex keepassxc kazam shutter
```

Native Linux games:

```sh
# Install 0ad
sudo apt install 0ad 0ad-data
```

## zRAM

I have plenty of memory in my system, you could argue to not need a swap at all (which is a valid point, and might be fine).  
But using a swapfile is so 2004. 

Today you could also use [zram](https://wiki.archlinux.org/title/Zram), so let's use that instead of a swap file.

### Disable swap file

First disable swap file:

```sh
sudo nano /etc/fstab
```

Comment the swap line in the fstab config file.

And then also execute: `sudo swapoff /swapfile`

### Install & configure zram

Finally, install zram:

```sh
sudo apt install zram-config
```

I also changed the memory used for zram by editing the `/usr/bin/init-zram-swapping` file. Since by default it will use 50% of my RAM, which is a lot of swap when you have 128GB of RAM. So I changed the formula to: `mem=$((totalmem / 6 * 1024))`.

---

Optionally, you could increase the `vm.swappiness` in `/etc/sysctl.conf` to a value close or higher than 100. Which makes Linux to swap more aggressively. Linux Mint default is 60, which is fine.

---

After a reboot, I see my 20GB of zram:

```sh
cat /proc/swaps                                                                                          
Filename				Type		Size		Used		Priority
/dev/zram0                              partition	21897424	0		5
```

## XFCE

In case of XFCE (_disclaimer:_ can break your system):

```sh
# Latest of the latest XFCE, thunar, catfish, tumbler from staging
sudo add-apt-repository ppa:xubuntu-dev/staging
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
