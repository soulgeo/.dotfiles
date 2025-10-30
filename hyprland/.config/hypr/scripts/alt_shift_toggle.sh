#!/usr/bin/env sh
# Restore the normal 2-layout list (english + greek),
# then switch to the next layout in that list (so it toggles).
# This also serves as "exit Japanese and resume us<->gr toggling".
hyprctl keyword input:kb_layout us,gr >/dev/null 2>&1
# switch to next layout (will toggle between us and gr)
hyprctl switchxkblayout current next >/dev/null 2>&1
