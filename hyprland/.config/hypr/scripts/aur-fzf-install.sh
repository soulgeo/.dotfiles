#!/usr/bin/env bash
printf '\033]0;aur-fzf-install\007'
# fuzzy AUR search + install via yay (interactive, clears terminal before install)
clear
yay -Slq \
  | fzf --layout=reverse \
        --preview 'yay -Si {}' \
        --preview-window=down:60%:wrap \
        --bind "enter:execute(bash -lc 'clear; yay -S \"{}\"' < /dev/tty > /dev/tty 2>&1)+abort"
