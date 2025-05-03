#!/bin/bash
CURRENT_PROFILE=$(pactl list sinks | grep "Active Port" | awk '{print $3}')
echo "Jelenlegi profil: $CURRENT_PROFILE"

HEADPHONES="analog-output-headphones"
SPEAKER="analog-output-lineout"

if [[ "$CURRENT_PROFILE" == *"$HEADPHONES"* ]]; then
    pactl set-sink-port @DEFAULT_SINK@ $SPEAKER
    notify-send "Audio output changed" "Output switched to speakers" -i audio-speakers
else
    pactl set-sink-port @DEFAULT_SINK@ $HEADPHONES
    notify-send "Audio output changed" "Output switched to headphones" -i audio-headphones
fi
