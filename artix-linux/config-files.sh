#!/usr/bin/env sh

cd 
git clone https://github.com/arega24/suckless-dwm 
git clone https://github.com/arega24/dwm-dots-artix
git clone https://github.com/arega24/Neovim 
mkdir .config 
cp -r suckless-dwm/dwm-6.4-patched .config/ 
cp -r suckless-dwm/slstatus .config/ 

mkdir ~/.config/nvim 
cp -r Neovim/* ~/.config/nvim/ 

cp -r ~/dwm-dots-artix/config/* ~/.config/

cp dwm-dots-artix/home/Xresources ~/.Xresources 
cp dwm-dots-artix/home/xinitrc ~/.xinitrc 
cp dwm-dots-artix/home/bashrc ~/.bashrc 

mkdir ~/Imagens
mkdir ~/Documentos
mkdir ~/Desktop
mkdir ~/Downloads

sudo mkdir -p /media/Shared/
sudo mkdir -p /media/Music/
sudo mkdir -p /media/Movies/
sudo mkdir -p /media/Series/
