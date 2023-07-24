#!/usr/bin/env sh

# Edit /etc/pacman.conf and enable Artix [lib32] and Arch [multilib] repositories. Need to enabe [Extra] for lutris 
# then upgrade the system -> pacman -Syu

# steam
sudo pacman -S steam ttf-liberation
# wine
sudo pacman -S wine
# lutris
sudo pacman -S lutris 

# Controler dont need adicional pkgs
# wheel suport g923 (need to reboot after)
sudo pacman -S joyutils
yay -S oversteer new-lg4ff-dkms-git


