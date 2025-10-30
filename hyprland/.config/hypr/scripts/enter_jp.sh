#!/usr/bin/env sh
# Put Japanese first in the layout list and select it (index 0)
# Adjust the layout name if you want a specific variant (e.g. jp, kana, or jp with variant)
hyprctl keyword input:kb_layout jp,us,gr >/dev/null 2>&1
# make the active layout the first entry (jp)
hyprctl switchxkblayout current 0 >/dev/null 2>&1
