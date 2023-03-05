#!/bin/env sh

## xorg
sudo xbps-install xorg-minimal xrdb xclip xrandr -y 

## keyboard xorg set
sudo xbps-install setxkbmap -y 

## enable void nonfree repo (needed to install intel firmware and nvidia drivers)
sudo xbps-install void-repo-nonfree -y 
sudo xbsp-install -S 
## Uncoment within your necessety

## Firmware intel
#sudo xbps-install intel-ucode 
#sudo xbps-reconfigure -fa  # it is necessary to regenerate your initramfs. this comand regenerate all

## Firmware amd (cpus and gpus)
#sudo xbps-install linux-firmware-amd mesa-dri vulkan-loader xf86-video-amdgpu -y 
#sudo xbps-install mesa-vulkan-radeon -y 
#sudo xbps-install mesa-vaapi mesa-vdpau -y 

## nvidia propriatary (1660 super) (nvidia == latast version; nvidia470 == ver 470)
#sudo xbps-install nvidia -y 

## power management (desktop)
#sudo ln -s /etc/sv/acpid/ /var/service/ -y 
#sudo sv status acpid -y 

## power management (laptop)
#sudo ln -s /etc/sv/acpid/ /var/service/ 
#sudo sv status acpid 
#sudo xbps-install tlp -y 
#sudo ln -s /etc/sv/tlp/ /var/service/ 
#sudo sv status tlp 

## dbus
sudo xbps-install dbus -y 
sudo ln -s /etc/sv/dbus/ /var/service/ 

## wifi card
#sudo xbps-install linux-firmware linux-firmware-network

## iwd (for wifi ,works with eduroam)
#sudo xbps-install iwd 
#sudo ln -s /etc/sv/iwd /var/service/

# network manager
#sudo xbps-install NetworkManager
#ln -s /etc/sv/NetworkManager/ /var/service/


## Eduroam network manager
#sudo xbps-install python3-dbus
# Download python setup scrypt here https://cat.eduroam.org/

## Firewall
#sudo xbps-install ufw -y 
#sudo ln -s /etc/sv/ufw/ /var/service/ 
#sudo sv status ufw 

## pipewire (setup dbus before)
sudo xbps-install pipewire pulsemixer pamixer libjack-pipewire alsa-pipewire qpwgraph elogind -y 
# for elogind to make efect, logout and login
sudo ln -s /etc/sv/pipewire /var/service/ 
sudo ln -s /etc/sv/pipewire-pulse /var/service/ 
## alsa 
sudo mkdir -p /etc/alsa/conf.d 
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d 
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d 

# jack
sudo echo "/usr/lib/pipewire-0.3/jack" > /etc/ld.so.conf.d/pipewire-jack.conf 
sudo ldconfig 

## dwm utility
sudo xbps-install -S base-devel libX11-devel libXft-devel libXinerama-devel xsetroot -y 

## the rest
sudo xbps-install pywal python -y 
sudo xbps-install feh redshift rxvt-unicode picom pfetch zip git xsecurelock htop qalculate keepassxc syncthing flameshot sxiv mpv timeshift diskonaut -y 
sudo xbps-install rofi rofi-calc udisks2 -y 
sudo xbps-install xdg-utils -y 
sudo xbps-install libnotify dunst -y
sudo xbps-install zathura zathura-pdf-poppler -y 
sudo xbps-install lf ueberzug GraphicsMagick ffmpeg ghostscript zsh trash-cli fzf bat unrar -y 
sudo xbps-install plata-theme lxappearance papirus-icon-theme -y 

## nfs
sudo xbps-install nfs-utils sv-netmount -y 
sudo ln -s /etc/sv/statd/ /var/service/ 
sudo ln -s /etc/sv/rpcbind/ /var/service/ 
sudo ln -s /etc/sv/netmount/ /var/service/ 


## neovim
sudo xbps-install neovim yarn nodejs wget pwsh -y  # nodejs and yarn needed for mardown preview 

## xdg
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http 
xdg-mime default sxiv.desktop image/jpeg 
xdg-mime default sxiv.desktop image/png

## Brillo 
sudo xbps-install brillo


