#!/bin/bash

THEME_DIR="$HOME/.config/themechanger/themes"
SELECTED=$(ls "$THEME_DIR" | rofi -dmenu -p "Theme:")

if [ -n "$SELECTED" ]; then
    ~/.config/themechanger/apply_theme.sh "$SELECTED"
fi
