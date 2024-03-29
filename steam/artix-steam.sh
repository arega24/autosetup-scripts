#!/usr/bin/env sh

# Edit /etc/pacman.conf and enable Artix [lib32] and Arch [multilib] repositories. Need to enabe [Extra] for lutris 
# then upgrade the system -> pacman -Syu

# steam
sudo pacman -S steam ttf-liberation
# wine
sudo pacman -S wine
# lutris
sudo pacman -S lutris 
# heroic games
flatpak install flathub com.heroicgameslauncher.hgl

# Controler dont need adicional pkgs
# wheel suport g923 (need to reboot after)
# !! The headers pkg depends on the kernel in use. (ex: If you use the zen kernel its "linux-zen-headers" same for lts and others)
sudo pacman -S joyutils linux-headers 
yay -S oversteer new-lg4ff-dkms-git


