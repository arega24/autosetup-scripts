#!/bin/env sh

## RUN THE SCRIPT AS SUPER USER

## Brillo is missig (only works for laptops)
## For instalation see https://gitlab.com/cameronnemo/brillo

xbps-install -Su &
xbps-install -Su &
xbps-install -Su &
xbps-install -Su &

## xorg
xbps-install xorg-minimal &

## keyboard xorg set
xbps-install setxkbmap &

## enable void nonfree repo (needed to install intel firmware and nvidia drivers)
xbps-install void-repo-nonfree &

## Uncoment within your necessety

## Firmware intel
#xbps-install intel-ucode &
#xbps-reconfigure -fa & # it is necessary to regenerate your initramfs. this comand regenerate all

## Firmware amd (cpus and gpus)
#xbps-install linux-firmware-amd mesa-dri vulkan-loader amdgpu &
#xbps-install mesa-vulkan-radeon & 
#xbps-install mesa-vaapi mesa-vdpau &

## nvidia propriatary (1660 super) (nvidia == latast version; nvidia470 == ver 470)
#xbps-install nvidia &

## power management (desktop)
#ln -s /etc/sv/acpid/ /var/service/ &
#sv status acpid &

## power management (laptop)
#ln -s /etc/sv/acpid/ /var/service/ &
#sv status acpid &
#xbps-install tlp &
#ln -s /etc/sv/tlp/ /var/service/ &
#sv status tlp &

## Firewall
xbps-install ufw &
ln -s /etc/sv/ufw/ /var/service/ &
sv status ufw &

## pipewire (setup dbus before)
xbps-install pipewire pulsemixer pamixer libjack-pipewire alsa-pipewire qpwgraph elogind &
# for elogind to make efect, logout and login
ln -s /etc/sv/pipewire /var/service/ &
ln -s /etc/sv/pipewire-pulse /var/service/ &
## alsa 
mkdir -p /etc/alsa/conf.d &
ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d &
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d &

# jack
echo "/usr/lib/pipewire-0.3/jack" > /etc/ld.so.conf.d/pipewire-jack.conf &
ldconfig &

## dwm utility
xbps-install -S base-devel libX11-devel libXft-devel libXinerama-devel xsetroot &

## the rest
xbps-install pywal python \
	feh redshift rxvt-unicode pfetch zip git xsecurelock htop qalculate keepassxc syncthing flameshot sxiv mpv timeshift \
	rofi rofi-calc udisks2 \
	xdg-utils \
	libnotify dunst \
	zathura zathura-pdf-poppler \
	lf ueberzug GraphicsMagick ffmpeg ghostscript zsh trash-cli fzf bat \
	plata-theme lxappearance papirus-icon-theme &

## nfs
xbps-install nfs-utils sv-netmount &
ln -s /etc/sv/statd/ /var/service/ &
ln -s /etc/sv/rpcbind/ /var/service/ &
ln -s /etc/sv/netmount/ /var/service/ &

## dbus
xbps-install dbus &
ln -s /etc/sv/dbus/ /var/service/ &

## neovim
xbps-install neovim yarn nodejs wget pwsh & # nodejs and yarn needed for mardown preview 

## xdg
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http &
xdg-mime default sxiv.desktop image/jpeg &
xdg-mime default sxiv.desktop image/png

## Brillo comes here
