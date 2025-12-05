#!/bin/bash

STATE_FILE="/tmp/waybar_clock_state"

if [ ! -f "$STATE_FILE" ]; then
    echo "short" > "$STATE_FILE"
    exit
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "short" ]; then
    echo "long" > "$STATE_FILE"
else
    echo "short" > "$STATE_FILE"
fi
