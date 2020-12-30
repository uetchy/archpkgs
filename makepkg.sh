#!/bin/sh
sudo pacman -Sy
makepkg -sf --needed --noconfirm
makepkg --printsrcinfo > .SRCINFO
