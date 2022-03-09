#!/bin/bash -ue
sudo pacman -Syu --noconfirm
makepkg -sfi --needed --noconfirm
makepkg --printsrcinfo > .SRCINFO
