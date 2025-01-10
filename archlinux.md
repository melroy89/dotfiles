# Arch Linux

Arch Linux is an open source, rolling release Linux distribution.

## Prepare for install

After `archinstall` and selecting Cinnamon as desktop environment (DE) in my case. There are still plenty of packages that I need to install.

I start with installing yay package manager:

```sh
sudo pacman -Syu
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

**Important:** Be sure to also enable `multilib` (for 32-bit packages) used for Wine. Edit the file: `sudo nano /etc/pacman.conf` enable the following two lines:

```conf
[multilib]
Include = /etc/pacman.d/mirrorlist
```

## Packages

Below a list of most important packages, in random order, after a successful `archinstall` installation  (do **NOT** use `sudo` with `yay`):

```sh
yay -S fastfetch btop iperf3 keepassxc gnome-calculator gnome-disk-utility gnome-screenshot xreader  nemo-fileroller foliate gparted gthumb mpv inkscape keepassxc mumble neovim nextcloud-client peek element-desktop telegram-desktop torbrowser-launcher wireshark-qt ttf-dejavu ttf-dejavu-nerd gimp libreoffice-fresh wine winegui
```

_Disclaimer:_ You might use other applications, these are the packages I use on almost a daily basis.