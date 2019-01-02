# dotfiles + extra software

My Linux dotfiles, a collection of custom configuration files. See [Melroy's home](home/melroy) folder.

I'm using [Manjaro](https://manjaro.org/get-manjaro/) v18.

Besides my dot files you will see some configuration files from [/etc](etc) folder.

## Extra packages

Extra installed packages:

`# pacman -S 0ad 0ad-data nfs-utils telegram-desktop etcher compton conky conky-manager celestia darktable deepin-calculator deepin-calendar deepin-voice-recorder filezilla transmission-gtk dnsutils retroarch retroarch-assets-xmb libretro-snes9x libretro-shaders-cg libretro-reicast libretro-ppsspp libretro-overlays libretro-mupen64plus libretro-gambatte libretro-core-info nginx mariadb php php-fpm php-gd php-intl wine-staging-nine`

Extra installed AUR packages (Enable AUR within the pamac Settings window):

`# pamac install atom-editor-bin green-recorder emulationstation emulationstation-autoscraper`

Try:

`simplescreenrecorder`

Replaced packages:
* Via Manjaro Settings Manager, installed Nvidia driver (v340 in my case): `video-nvidia-340xx`

## Firewall rules (ufw)

This is the graphical viewer (`gufw`):

![Firewall rules](firewall_rules.png)