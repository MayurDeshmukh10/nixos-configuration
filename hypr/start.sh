#!/usr/bin/env bash

# To fix slow opening of some apps
#sleep 2
#killall -e xdg-desktop-portal-hyprland
#killall -e xdg-desktop-portal-wlr
#killall xdg-desktop-portal
#/usr/lib/xdg-desktop-portal-hyprland &
#sleep 2
#/usr/lib/xdg-desktop-portal &

# initializing wallpaper daemon
hyprpaper & 

# network manager applet
nm-applet --indicator &

# app bar
waybar &
#waybar -c ~/.config/waybar/themes/config -s ~/.config/waybar/themes/style.css &

# notification daemon
#dunst
swaync

pypr
# hypridle
#hypridle &


#[workspace 1 silent] kitty
#[workspace 2 silent] thunderbird
#[workspace 3 silent] firefox

