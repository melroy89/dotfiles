# Melroy's GNU/Linux setup

Hi! My GNU/Linux dotfiles, a collection of Unix configuration files. See [Melroy's home](home/melroy) folder.

**Currently Running:** [Linux Mint XFCE](https://www.linuxmint.com/edition.php?id=278) (I used to use: [Manjaro](https://manjaro.org/get-manjaro/), and many many other distros I tried in the past).

Besides my personal dot files (in [home](home/melroy)), you'll find some configuration files from [/etc](etc) folder as bonus material!

## Shells

## Starship

Install Starship, awesome prompt for any shell:

`curl -fsSL https://starship.rs/install.sh | bash`

![Starship in action](starship.png)

## Fish Shell

Install [Fish shell](https://fishshell.com/). See functions in `/home/melroy/.config/fish/functions`.

**Status:** Using Bash with Starship.

## Hardware setup

Current hardware setup (planned to upgrade *all components* except GPU):

* CPU: Intel Core i7 920 
* Motherboard: Asus Rampage II Extreme
* Memory: Corsair XMS Dominator 6GB DDR3 triple kit 
* Videocard: AMD Radeon RX 580
* Storage: Corsair F120 Force Series SSD 120GB
* Monitors: Samsung SyncMaster 2494HM & AOC G2590PX (FreeSync 144Hz)

## Games

Native games:

* 0ad

A lot of games I play via Wine (`wine` = Wine Is *NOT* an Emulator) under GNU/Linux or Proton via Steam.

## Manjaro

### Packages

Extra installed packages:

`# pacman -S nfs-utils telegram-desktop etcher compton conky conky-manager celestia darktable deepin-calculator deepin-calendar deepin-voice-recorder filezilla transmission-gtk dnsutils retroarch retroarch-assets-xmb libretro-snes9x libretro-shaders-cg libretro-reicast libretro-ppsspp libretro-overlays libretro-mupen64plus libretro-gambatte libretro-core-info nginx mariadb php php-fpm php-gd php-intl wine-staging-nine wine-tricks furiousisomount`

Extra installed AUR packages (Enable AUR within the pamac Settings window):

`# pamac install atom-editor-bin green-recorder emulationstation emulationstation-autoscraper`

Try:

`simplescreenrecorder`

`discord` (PTB) via deb

`peek`

## Videocard

Use the Manjaro Settings Manager -> Hardware to install any open-source AMDGPU driver (if needed).

And in additional, install:
`# pacman -S vulkan-tools`

## Wine
Start clean:
`rm -rf ~/.wine`

During first start, use the following command to create a 32bit wine:
`WINEARCH=win32 wine wineboot`

Install via winetricks, for the current wine prefix:
@fonts:
* corefonts

@Windows DLL/Components:
* ie7 (first IE before install anything else; because of Internet Connectivity)
* d3dx9
* dotnet35
* dxvk
* mfc42

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
