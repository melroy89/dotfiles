#!/usr/bin/env bash
#
# By: Melroy van den Berg
# Description: XFCE setup script for Void Linux
#
# Prerequisites: Having Juno-v40 and Papirus-Dark and DejaVuSansM Nerd Font installed
#################

# Using the gsettings command to change the GTK, Icon & Windows theme + font
gsettings set org.gnome.desktop.interface gtk-theme "Juno-v40"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Juno-v40"
gsettings set org.gnome.desktop.interface font-name "Ubuntu 10"

##########################################
# xfce4 General Settings
##########################################
# set xfce4 theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Juno-v40"
# set xfce4 icon theme
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
# set default font
xfconf-query -c xsettings -p /Gtk/FontName -s "Ubuntu 10"
# set default monospace font
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "DejaVuSansM Nerd Font Mono Rengular 11"

##########################################
# xfwm4 Window Manager Settings
##########################################
# set xfwm4 window manager theme
xfconf-query -c xfwm4 -p /general/theme -s "Juno-v40"
# set xfwm4 window manager title font
xfconf-query -c xfwm4 -p /general/title_font -s "Ubuntu Medium 10"

##########################################
# Panel & Menu Configuration
##########################################
# Remove panel ...?
xfconf-query -c xfce4-panel -p /panels -t int -s 0 -a

# Set thepanel size to 40 pixels
xfconf-query -c xfce4-panel -p /panels/panel-1/size -s 40
# Set panel position to bottom (p=4), x/y is used in other positions modes
xfconf-query -c xfce4-panel -p /panels/panel-1/position -s "p=4;x=640;y=482"
# Set icon size to automatically
xfconf-query -c xfce4-panel -p /panels/panel-1/icon-size -s 0
# Remove Workspace Switcher plugin from panel 1
xfconf-query -c xfce4-panel -p /panels/panel-1/plugins/plugin-x -rR

# TODO:
# - Change clock to 'time only' and then put it to custom format: `%a %_d %b, %R` and change font to Sans Bold

##########################################
# Panel plugins
##########################################

# Set icon size automatically on Status Tray plugin
xfconf-query -c xfce4-panel -p /plugins/plugin-6/icon-size -s 0
# Disable grouping on Window Buttons plugin
xfconf-query -c xfce4-panel -p /plugins/plugin-2/grouping -s false
# Disable show handle on Window Buttons plugin
xfconf-query -c xfce4-panel -p /plugins/plugin-2/show-handle -s false
# Show action button in Action Buttons plugin
xfconf-query -c xfce4-panel -p /plugins/plugin-14/appearance -s 0
# Show only lock & shutdown buttons in Action Buttons plugin
xfconf-query -c xfce4-panel -p /plugins/plugin-14/items -n -a -t string -s "+lock-screen" -t string -s "-switch-user" -t string -s "-separator" -t string -s "-suspend" -t string -s "-hibernate" -t string -s "-hybrid-sleep" -t string -s "-separator" -t string -s "+shutdown" -t string -s "-restart" -t string -s "-separator" -t string -s "-logout" -t string -s "-logout-dialog"
# Create show desktop plugin (reuse plugin?)
xfconf-query -c xfce4-panel -p /plugins/plugin-x -n -t string -s "showdesktop"
# Create Launcher plugin (reusing plugin ...x?) and add items to launcher
xfconf-query -c xfce4-panel -p /plugins/plugin-x -n -t string -s "launcher"
xfconf-query -c xfce4-panel -p /plugins/plugin-x/items -n -a -t string -s "firefox.desktop" -t string -s "xfce4-terminal-emulator.desktop" -t string -s "xfce4-file-manager.desktop"

##########################################
# Thunar Configuration
##########################################
# set default view to 'details'
xfconf-query -c thunar -p /default-view -s "ThunarDetailsView"
# sort by type
xfconf-query -c thunar -p /last-sort-column -s "THUNAR_COLUMN_DATE_MODIFIED"
# sort in ascending order
xfconf-query -c thunar -p /last-sort-order -s "GTK_SORT_DESCENDING"
# visible columns in details view, adding permissions column
xfconf-query -c thunar -p /last-details-view-visible-columns -s "THUNAR_COLUMN_DATE_MODIFIED,THUNAR_COLUMN_NAME,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE,THUNAR_COLUMN_PERMISSIONS"
# set date style to YYYY-MM-DD. I still like to use THUNAR_DATE_STYLE_SHORT
#xfconf-query -c thunar -p /misc-date-style -s "THUNAR_DATE_STYLE_YYYYMMDD"

# Add bookmarks to the Thunar file manager
echo -e "file:///home/melroy/Documents\nfile:///home/melroy/Music\nfile:///home/melroy/Pictures\nfile:///home/melroy/Videos\nfile:///home/melroy/Downloads\nfile:///home/melroy/Nextcloud\nfile:///media/melroy/Data/Projects\nfile:///media/melroy/Data/Games" >> ~/.config/gtk-3.0/bookmarks

# Restart the panels once to apply the changes
xfce4-panel -r


# TODO: Change default Terminal font
