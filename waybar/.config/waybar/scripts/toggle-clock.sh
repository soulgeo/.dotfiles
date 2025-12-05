#!/bin/bash

STATE_FILE="/tmp/waybar_clock_state"

# Create file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "short" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "short" ]; then
    date +"%H:%M  -  %A, %d"
else
    date +"%H:%M:%S  -  %A, %d"
fi
