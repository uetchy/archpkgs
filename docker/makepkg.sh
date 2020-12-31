#!/bin/sh
# sudo pacman -Sy
makepkg -sfi --needed --noconfirm
makepkg --printsrcinfo > .SRCINFO
$@