#!/bin/bash

CURRENT_SHADER=$(hyprshade current 2>/dev/null)

if [[ "$CURRENT_SHADER" == "vibrance" ]]; then
    hyprshade off
else
    hyprshade on vibrance
fi
