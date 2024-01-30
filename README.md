# Melroy's GNU/Linux setup

Hi! My GNU/Linux dotfiles, a collection of Unix configuration files.

Check-out the [Melroy's home](home/melroy) folder for all my personal files/configurations.

**Currently Running:** [Linux Mint XFCE](https://www.linuxmint.com/edition.php?id=278) (I ran [Manjaro](https://manjaro.org/get-manjaro/), Ubuntu, Fedora, openSUSE and many many other distros in the past). I'm planning to move to Void Linux.

Besides my personal dot files (in [home](home/melroy)), you'll find some configuration files from [/etc](etc) folder as _bonus material_!

## Shells

### Font

I use the nerd terminal font: "[DejaVuSansM Nerd Font Mono Regular](https://www.nerdfonts.com/font-downloads)" 11 pt (fallback: "DejaVu Sans Mono Book").

I sometimes also use: "[Terminus Regular](http://terminus-font.sourceforge.net/)" (not TTF) 10 pt, install package: `xfonts-terminus`.

The reason to use a Nerd Font is because I also use [Starship](https://starship.rs/) as shell prompt.

Add add a new file to `~/.config/fontconfig/fonts.conf`, with content to disable hinting and anti-alias in Terminals (mono-fonts):

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!--   <match target="pattern">
   <test qual="any" name="family"><string>monospace</string></test>
   <edit name="family" mode="prepend" binding="same"><string>DejaVu Sans Mono</string></edit>
   <edit name="family" mode="prepend" binding="same"><string>Droid Sans Mono</string></edit>
  </match> -->

  <match target="pattern">
    <test qual="any" name="family"><string>DejaVu Sans Mono</string></test>
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
    <test qual="any" name="family"><string>DejaVuSansM Nerd Font Mono</string></test>
    <edit name="antialias" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
    <edit name="hinting" mode="assign"><bool>false</bool></edit>
    <edit name="rgba" mode="assign"><const>rgb</const></edit>
    <edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
  </match>
</fontconfig>
```

### XFCE Automation

I created a [handy setup shell script](setup-xfce.sh) which sets all the XFCE settings to my liking.

### Starship

Install Starship, awesome prompt for any shell:

`curl -fsSL https://starship.rs/install.sh | bash`

![Starship in action](starship.png)

**Status:** I'm using Bash with [Starship](https://starship.rs/). And I use `DejaVuSansM Nerd Font Mono Regular` with 11 pt as my terminal font. Together with fontconfig changes (see above).

## Hardware setup

Current hardware setup (planned to upgrade _all components_ except GPU):

- CPU: Intel Core i7 920
- Motherboard: Asus Rampage II Extreme
- Memory: Corsair XMS Dominator 6GB DDR3 triple kit
- Videocard: Sapphire Limited Nitro+ AMD Radeon RX 580
- Storage: Corsair F120 Force Series SSD 120GB
- Monitors: 1x Samsung SyncMaster 2494HM & 2x AOC G2590PX (FreeSync 144Hz)

## Git config

See my [.gitconfig](home/melroy/.gitconfig) file.

Features:

- List of useful aliases in git
- Always GPG sign commits
- Always prefer rebase and auto squash/stash
- Use [VSCodium](https://vscodium.com/) as merge and diff by default
- Auto-correct typos

## Games

Native games:

- 0ad
- Parkitect
- Planetary Annihilation

I also play some of games via Wine (`wine` = Wine Is Not an Emulator) under GNU/Linux. Or using Proton from Steam.

Like AoE2 HD, Command & Conquer - Red Alert and full Halo series.

## Linux Mint (XFCE)

_Update 2024:_ I'm planning to move to Void Linux soon.

### PPA packages

```
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
# Nice collection of apps/games
sudo add-apt-repository ppa:xtradeb/apps

# Trigger update
sudo apt-get update
```

### Packages

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
sudo apt install codium firefox wine win32:i386 wine64 filezilla peek kazam nginx php7.4-cli php7.4-fpm dnsutils lm-sensors vulkan-tools keepassxc shutter inkscape
```

**Games**

```sh
# Install 0ad
sudo apt install 0ad
```

## Web-browser

Firefox! With additional extensions installed:

- uBlock Origin
- AdBlocker for YouTube
- KeePassXC-Browser (together with my local KeePassXC installation)
- WebRTC Leak Shield
- RESTClient
- Vue.js Devtools
- IPFS Companion

## Wine

See also my other project: [WineGUI](https://gitlab.melroy.org/melroy/winegui)

Start clean:

`rm -rf ~/.wine`

During first start, use the following command to create a 32-bit wine bottle:
`WINEARCH=win32 wine wineboot`

Install via winetricks, for the current wine prefix:
@fonts:

- corefonts

@Windows DLL/Components:

- d3dx9 (for DirectX9 support)
- dxvk (for Vulkan support)
- optionally: mfc42
- optionally: vcrun2xxx (eg. 2013 for the required DLLs)

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

When you want to be sure your monitor settings are kept the same (also during 'lock screen'). It's advised to setup these settings in `/usr/share/X11/xorg.conf.d` folder.

See my [10-monitor.conf](usr/share/X11/xorg.conf.d/10-monitor.conf) example in my case (dual-monitor setup, right monitor is primary).

**Hint:** Finding the monitor identifier can be done by running `xrandr -q` on the command-line.

**Note:** Files (eg. 10-amdgpu.conf) that are installed by default by the open-source driver (AMDGPU), are not stored within this repository.

## Firewall rules (ufw)

Optionally configured firewall.

This is the graphical viewer (`gufw`):

![Firewall rules](firewall_rules.png)
