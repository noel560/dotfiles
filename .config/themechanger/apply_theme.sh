#!/bin/bash

THEME="$1"
BASE="$HOME/.config/themechanger/themes/$THEME"

if [ ! -d "$BASE" ]; then
    notify-send "Theme Changer" "A téma nem létezik: $THEME"
    exit 1
fi

# Waybar
# if [ -f "$BASE/waybar/colors.css" ]; then
#     cp "$BASE/waybar/colors.css" "$HOME/.config/waybar/colors.css"
#     pkill -USR2 waybar
# fi

# Alacritty
# if [ -f "$BASE/alacritty.toml" ]; then
#     cp "$BASE/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
#     pkill -USR1 alacritty
# fi

# Btop
# if [ -f "$BASE/btop.theme" ]; then
#     TARGET=$(cat "$BASE/btop.theme")
#     sed -i "s|^color_theme =.*|color_theme = \"$TARGET\"|" "$HOME/.config/btop/btop.conf"
# fi

# Wallpaper
if [ -f "$BASE/wallpaper.jpg" ]; then
    cp "$BASE/wallpaper.jpg" "$HOME/.config/wallpapers/current.jpg"
    [ -f "$HOME/.config/wallpapers/current.png" ] && rm "$HOME/.config/wallpapers/current.png"
    [ -f "$HOME/.config/wallpapers/current.mp4" ] && rm "$HOME/.config/wallpapers/current.mp4"
    pkill -x mpvpaper 2>/dev/null
    swww img "$HOME/.config/wallpapers/current.jpg" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90 --transition-fps 144
    wal -i "$HOME/.config/wallpapers/current.jpg"
fi

# Wallpaper .2
if [ -f "$BASE/wallpaper.png" ]; then
    cp "$BASE/wallpaper.png" "$HOME/.config/wallpapers/current.png"
    [ -f "$HOME/.config/wallpapers/current.jpg" ] && rm "$HOME/.config/wallpapers/current.jpg"
    [ -f "$HOME/.config/wallpapers/current.mp4" ] && rm "$HOME/.config/wallpapers/current.mp4"
    pkill -x mpvpaper 2>/dev/null
    swww img "$HOME/.config/wallpapers/current.png" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90 --transition-fps 144
    wal -i "$HOME/.config/wallpapers/current.png"
fi

# Wallpaper (Animated)
if [ -f "$BASE/wallpaper.mp4" ]; then
    cp "$BASE/wallpaper.mp4" "$HOME/.config/wallpapers/current.mp4"
    [ -f "$HOME/.config/wallpapers/current.png" ] && rm "$HOME/.config/wallpapers/current.png"
    [ -f "$HOME/.config/wallpapers/current.jpg" ] && rm "$HOME/.config/wallpapers/current.jpg"
    pkill -x mpvpaper 2>/dev/null
    sleep 0.3
    wal -i "$HOME/.config/wallpapers/current.mp4"
    mpvpaper -o "loop-file mute" '*' "$HOME/.config/wallpapers/current.mp4" &
fi

# Reload
hyprctl reload
python3 "$(dirname "$0")/generate_btop.py"
pkill -USR2 btop
#pkill -x mpvpaper 2>/dev/null

#notify-send "Theme applied" "Theme: $THEME"
