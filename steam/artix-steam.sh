#!/bin/env sh

# Edit /etc/pacman.conf and enable Artix [lib32] and Arch [multilib] repositories
# then upgrade the system -> pacman -Syu

# steam
sudo pacman -S steam ttf-liberation
# wine
yay -Ss wine-stable
# lutris
sudo pacman -S lutris
# controler and wheel suport


