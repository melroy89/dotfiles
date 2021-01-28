# Melroy's GNU/Linux setup

Hi! My GNU/Linux dotfiles, a collection of Unix configuration files. See [Melroy's home](home/melroy) folder.

**Currently Running:** [Linux Mint XFCE](https://www.linuxmint.com/edition.php?id=278) (I also used [Manjaro](https://manjaro.org/get-manjaro/), and many many other distros in the past).

Besides my personal dot files (in [home](home/melroy)), you'll find some configuration files from [/etc](etc) folder as bonus material!

## Shells

### Font

I use the terminal font "[Terminus Regular](http://terminus-font.sourceforge.net/)" (not TTF) 10 pt, install package: `xfonts-terminus`.

Add add a new file to `~/.config/fontconfig/fonts.conf`, with content:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="pattern">
   <test qual="any" name="family"><string>monospace</string></test>
   <edit name="family" mode="prepend" binding="same"><string>Ubuntu Mono</string></edit>
   <edit name="family" mode="prepend" binding="same"><string>Droid Sans Mono</string></edit>
   <edit name="family" mode="prepend" binding="same"><string>Liberation Mono</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>Ubuntu Mono</string></test>
    <edit name="antialias" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
    <edit name="hinting" mode="assign"><bool>false</bool></edit>
    <edit name="rgba" mode="assign"><const>rgb</const></edit>
    <edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
  </match>
  <match target="pattern">
    <test qual="any" name="family"><string>Droid Sans Mono</string></test>
    <edit name="antialias" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
    <edit name="hinting" mode="assign"><bool>false</bool></edit>
    <edit name="rgba" mode="assign"><const>rgb</const></edit>
    <edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
  </match>
  <match target="pattern">
    <test qual="any" name="family"><string>Liberation Mono</string></test>
    <edit name="antialias" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
    <edit name="hinting" mode="assign"><bool>false</bool></edit>
    <edit name="rgba" mode="assign"><const>rgb</const></edit>
    <edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
  </match>
</fontconfig>
```

### Starship

Install Starship, awesome prompt for any shell:

`curl -fsSL https://starship.rs/install.sh | bash`

![Starship in action](starship.png)

### Fish Shell

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
* Parkitect
* Planetary Annihilation

I also play a lot of games via Wine (`wine` = Wine Is Not an Emulator) under GNU/Linux. Or using Proton from Steam.

Like AoE2 HD, Command & Conquer - Red Alert and full Halo series.

## Manjaro

### Packages

Extra installed packages:

```sh
# pacman -S nfs-utils telegram-desktop etcher compton conky conky-manager celestia darktable deepin-calculator deepin-calendar deepin-voice-recorder filezilla transmission-gtk dnsutils retroarch retroarch-assets-xmb libretro-snes9x libretro-shaders-cg libretro-reicast libretro-ppsspp libretro-overlays libretro-mupen64plus libretro-gambatte libretro-core-info nginx mariadb php php-fpm php-gd php-intl wine-staging-nine wine-tricks furiousisomount
```

Extra installed AUR packages (Enable AUR within the pamac Settings window):

`# pamac install atom-editor-bin green-recorder emulationstation emulationstation-autoscraper`

Try:

`simplescreenrecorder`

`discord` (PTB) via deb

`peek`

Install vulkan support: `# pacman -S vulkan-tools`

## Wine

See also my other project: [WineGUI](https://gitlab.melroy.org/melroy/winegui)

Start clean:

`rm -rf ~/.wine`

During first start, use the following command to create a 32-bit wine bottle:
`WINEARCH=win32 wine wineboot`

Install via winetricks, for the current wine prefix:
@fonts:
* corefonts

@Windows DLL/Components:
* d3dx9 (for DirectX9 support)
* dxvk (for Vulkan support)
* optionally: mfc42
* optionally: vcrun2xxx (eg. 2013 for the required DLLs)

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

## Xorg

When you want to be sure your monitor settings are kept the same (also during 'lock screen'). It's adviced to setup these settings in `/usr/share/X11/xorg.conf.d` folder.

See my [10-monitor.conf](usr/share/X11/xorg.conf.d/10-monitor.conf) example in my case (dual-monitor setup, right monitor is primary).

**Hint:** Finding the monitor identifier can be done by running `xrandr -q` on the command-line.

**Note:** Files (eg. 10-amdgpu.conf) that are installed by default by the open-source driver (AMDGPU), are not stored within this repository.

## Web-browser

Firefox! With additional extenstions installed:

* uBlock Origin
* LastPass
* WebRTC Leak Shield
* RESTClient
* IPFS Companion


## Firewall rules (ufw)

Optionally configured firewall.

This is the graphical viewer (`gufw`):

![Firewall rules](firewall_rules.png)

