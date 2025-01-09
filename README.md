# Melroy's GNU/Linux setup

Hi! My GNU/Linux dotfiles, a collection of Unix configuration files.

Check-out the [Melroy's home](home/melroy) folder for all my personal files/configurations.

Besides my personal dot files (in [home](home/melroy)), you'll find some configuration files from [/etc](etc) folder as _bonus material_!

I have two main installation guides with the specific the how-to's:

- [Linux Mint](linuxmint.md)
- [Void Linux](voidlinux.md)

Again, see the two guides above for more details. The rest down below is a general setup that can apply to basically any distro.

## XFCE Automation Script

I created a [handy setup shell script](setup-xfce.sh) which sets all the XFCE settings to my liking. This script does assume you have the prerequisites installed: [Juno-v40](https://www.gnome-look.org/p/1280977) GTK theme and [Papirus-Dark](https://www.gnome-look.org/p/1166289/) icon theme and [DejaVuSansM Nerd Font](https://www.nerdfonts.com/font-downloads).

## Shells fonts

I use the nerd terminal font: "[DejaVuSansM Nerd Font Mono Regular](https://www.nerdfonts.com/font-downloads)" 11 pt (fallback: "DejaVu Sans Mono Book").

I sometimes also use: "[Terminus Regular](http://terminus-font.sourceforge.net/)" (not TTF) 10 pt, install package: `xfonts-terminus`.

The reason to use a Nerd Font is because I also use [Starship](https://starship.rs/) as shell prompt.

I use the same mono font in my editor (eg. vscodium), use: `'DejaVuSansM Nerd Font Mono','DejaVu Sans Mono', 'Droid Sans Mono', 'monospace', monospace`

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

### Starship Prompt

Install [Starship](https://starship.rs/guide/), awesome prompt for any shell:

`curl -fsSL https://starship.rs/install.sh | bash`

![Starship in action](starship.png)

**Status:** I'm using Zsh with [Starship](https://starship.rs/). And I use `DejaVuSansM Nerd Font Mono Regular` with 11 pt as my terminal font. Together with fontconfig changes (see above).

I manually install plugins for zsh (**not** using Oh My Zsh), the plugins I like very much are:

- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [colorize](https://github.com/zpm-zsh/colorize)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

Just clone the above git repositories, in my case I created a sub-directory called `.zsh` and clones the repos in there.  
Finally, you source the `*.plugin.zsh` files within your [`~/.zshrc` file](home/melroy/.zshrc).

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

I also play some of games via Wine (`wine` = Wine Is Not an Emulator) under GNU/Linux using WineGUI. Or using Proton from Steam.

Like AoE2 HD, AoM, BF2, NFS3, NFS HP2, Command & Conquer - Red Alert 3 and full Halo series.

See also my other project: [WineGUI](https://gitlab.melroy.org/melroy/winegui).

## Web-browser

Floorp (fork of Firefox)! With additional extensions installed:

- uBlock Origin
- Return Youtube Dislike
- KeePassXC-Browser (together with my local KeePassXC installation)
- Page load time
- Hover Zoom+
- WebRTC Leak Shield
- Go Up
- DarkCloud

- User-Agent Switcher (when needed enabled)
- Vue.js Devtools (when developing VueJS Projects)

## Other tools

Other tools I may use on a regular or irregular basis :)

- neovim
- Vscodium / Zed
- Bruno
- Element / nheko
- htop / btop / iotop / iperf3 / iftop
- ghex
- peek
- AutoKey (gtk)
- Foliate
- gnome-calculator
- Qalculate!
- Minicom
- Wireshark
- X2Go
- Transmission
- Tor Browser
- Mumble
- WeeChat

## Wine

I install Wine is not an emulator + [WineGUI](https://gitlab.melroy.org/melroy/winegui).

## Display settings

I'm now just going to Display setting (`xfce4-display-settings`) -> Advanced -> And set "When new dispalys are connected" to: "Do nothing" option. I also have a dedicated profile with my settings and checked "Automatically enable profiles when new display is connect".

**Hint:** Finding the monitor identifier can be done by running `xrandr -q` on the command-line.

## Hardware setup

Current hardware setup:

- CPU: Intel Core i7 920
- Motherboard: Asus Rampage II Extreme
- Memory: Corsair XMS Dominator 6GB DDR3 triple kit
- Videocard: Sapphire Limited Nitro+ AMD Radeon RX 580
- Storage: Corsair F120 Force Series SSD 120GB
- Monitors: 1x Samsung SyncMaster 2494HM & 2x AOC G2590PX (FreeSync 144Hz)
