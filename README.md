# dotfiles + extra software

My Linux dotfiles, a collection of custom configuration files. See [Melroy's home](home/melroy) folder.

I'm using [Manjaro](https://manjaro.org/get-manjaro/) v18.

Besides my dot files you will see some configuration files from [/etc](etc) folder.

## Extra packages

Extra installed packages:

`# pacman -S 0ad 0ad-data nfs-utils telegram-desktop etcher compton conky conky-manager celestia darktable deepin-calculator deepin-calendar deepin-voice-recorder filezilla transmission-gtk dnsutils retroarch retroarch-assets-xmb libretro-snes9x libretro-shaders-cg libretro-reicast libretro-ppsspp libretro-overlays libretro-mupen64plus libretro-gambatte libretro-core-info nginx mariadb php php-fpm php-gd php-intl wine-staging-nine wine-tricks`

Extra installed AUR packages (Enable AUR within the pamac Settings window):

`# pamac install atom-editor-bin green-recorder emulationstation emulationstation-autoscraper`

Try:

`simplescreenrecorder`

# AMDGPU

Use the Manjaro Settings Manager -> Hardware to install any open-source AMDGPU driver (if needed).

# MySQL (MariaDB)
Before starting:
`mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql`

Set new root password, via:
`mysqladmin -u root password`

Then:
`systemctl start mariadb`
`systemctl enable mariadb`

## Firewall rules (ufw)

This is the graphical viewer (`gufw`):

![Firewall rules](firewall_rules.png)