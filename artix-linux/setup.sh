#!/usr/bin/env sh

## post install script 
## Run this to install required packages
## read and uncomment the required lines 

## xorg (apps + server)
sudo pacman -S xorg xorg-xinit 

## GPU - uncoment the right one
## Might need to enable Artix [lib32] and Arch [multilib] repositories in /etc/pacman.conf

## NVIDIA drivers (Proprietary)
# sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils 

## AMD drivers (Open source)
# sudo pacman -S xf86-video-amdgpu mesa lib32-mesa 

## dbus
sudo pacman -S dbus dbus-runit 
sudo ln -s /etc/runit/sv/dbus /run/runit/service 

## TLP- For laptop batery
# sudo pacman -S tlp tlp-runit 
# sudo ln -s /etc/runit/sv/tlp /run/runit/service 

## networkmanager in case its not enabled yet
#sudo ln -s /etc/runit/sv/networkmanager /run/runit/service 

## firewall
sudo pacman -S ufw-runit ufw
sudo ln -s /etc/runit/sv/ufw /run/runit/service 
sudo ufw limit 22/tcp 
sudo ufw allow 80/tcp 
sudo ufw allow 443/tcp
sudo ufw default deny incoming 
sudo ufw default allow outgoing 
sudo ufw enable 
sudo ufw status 

## pipewire
sudo pacman -S pipewire lib32-pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack rtkit 

## nfs
sudo pacman -S nfs-utils 

## neovim
sudo pacman -S neovim wget 

## AUR Dependencies/ useful pkgs
sudo pacman -S git base-devel 
git clone https://aur.archlinux.org/yay.git 
cd yay 
makepkg -si 
cd 

## The rest
sudo pacman -S python-pywal 
yay -S pfetch timeshift brillo librewolf-bin 
yay -S feh redshift rxvt-unicode picom zip xsecurelock htop libqalculate keepassxc syncthing flameshot sxiv mpv diskonaut       
yay -S libnotify dunst udisks2 rofi rofi-calc 
yay -S zathura zathura-pdf-poppler 
yay -S lf ueberzug graphicsmagick ffmpeg ghostscript zsh trash-cli fzf bat unrar 
yay -S lxappearance papirus-icon-theme arc-gtk-theme ttf-jetbrains-mono 
## pamixer and a dependency
yay -S cxxopts-git
yay -S pamixer-git

## xdg
sudo pacman -S xdg-utils 
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http 
xdg-mime default sxiv.desktop image/jpeg 
xdg-mime default sxiv.desktop image/png 
