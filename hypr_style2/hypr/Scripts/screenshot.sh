#!/bin/zsh

NOW=$(date +"%Y-%m-%d-%H%M%S")
grim -g "$(slurp)" -t png $HOME/Pictures/ScreenShot/grim-$NOW.png
ksnip $HOME/Pictures/ScreenShot/grim-$NOW.png
➜ pwd
$HOME/.config/scripts/
