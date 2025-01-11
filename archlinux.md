# Arch Linux

Arch Linux is an open source, rolling release Linux distribution.

## Intro

During the `archinstall` I selected `Cinnamon` as the  desktop environment (DE). I selected PipeWire as audio and `lightdm-gtk-greeter` as greeter. NetworkManager as the network option and `Systemd-boot` as the boot-loader. 

## Prepare for install

After the `archinstall` installation, there are still plenty of packages that I need to install.

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
yay -S fastfetch zsh zsh-completions btop iperf3 keepassxc gnome-calculator gnome-disk-utility \
gnome-screenshot gnome-backgrounds budgie-backgrounds xreader nemo-fileroller foliate \
gparted gthumb mpv inkscape keepassxc mumble neovim nextcloud-client peek autokey-gtk \
element-desktop telegram-desktop torbrowser-launcher wireshark-qt bind nvtop \
ttf-dejavu ttf-dejavu-nerd noto-fonts-emoji gimp libreoffice-fresh wine xorg-xkill
```

From the AUR I install:

```sh
yay -S floorp-bin pamac-aur vscodium winegui lact
```

_Disclaimer:_ You might use other applications, these are the packages that I use on a daily basis.