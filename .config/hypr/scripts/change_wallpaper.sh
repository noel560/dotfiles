#!/bin/bash

WALL="$HOME/.config/wallpapers/current"

# Ha mpvpaper futna → megöljük
pkill -x mpvpaper 2>/dev/null

sleep 0.3  # adjunk időt, hogy tényleg elpusztuljon

if [ -f "${WALL}.mp4" ]; then
    echo "Setting animated wallpaper with mpvpaper..."

    mpvpaper -o "loop-file mute" '*' "${WALL}.mp4"

elif [ -f "${WALL}.jpg" ]; then
    echo "Setting JPG wallpaper with swww..."

    swww img "${WALL}.jpg" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90

elif [ -f "${WALL}.png" ]; then
    echo "Setting PNG wallpaper with swww..."

    swww img "${WALL}.png" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90

else
    echo "Nincs wallpaper fájl barátom…"
    exit 1
fi
