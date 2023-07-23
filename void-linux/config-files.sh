#!/bin/env sh

cd 
git clone https://github.com/arega24/suckless-dwm 
git clone https://github.com/arega24/dwm-dots-void
git clone https://github.com/arega24/Neovim 
mkdir .config 
cp -r suckless-dwm/dwm-6.4-patched .config/ 
cp -r suckless-dwm/slstatus .config/ 

mkdir ~/.config/nvim 
cp -r Neovim/* ~/.config/nvim/ 

cp -r dwm-dots/dunst/ ~/.config/ 
cp -r dwm-dots/lf/ ~/.config/ 
cp -r dwm-dots/picom/ ~/.config/ 
cp -r dwm-dots/rofi/ ~/.config/ 
cp -r dwm-dots/scripts/ ~/.config/ 
cp -r dwm-dots/start_pages/ ~/.config/ 
cp -r dwm-dots/sxiv/ ~/.config/ 
cp -r dwm-dots/wal/ ~/.config/ 
cp -r dwm-dots/zathura/ ~/.config/ 

cp dwm-dots/Xresources ~/.Xresources 
cp dwm-dots/xinitrc ~/.xinitrc 
cp dwm-dots/bashrc ~/.bashrc 



