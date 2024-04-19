#!/usr/bin/env bash

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

