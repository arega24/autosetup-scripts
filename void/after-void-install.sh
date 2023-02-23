#!/bin/env sh

cd &
git clone https://github.com/arega24/suckless-dwm &
git clone https://github.com/arega24/dwm-dots &
git clone https://github.com/arega24/Neovim &
mkdir .config &
cp suckless-dwm/dwm-6.4-patched .config/ &
cp suckless-dwm/slstatus .config/ &

mkdir ~/.config/nvim &
cp Neovim/* ~/.config/nvim/ &

cp dwm-dots/{dunst,lf,picom,rofi,scripts,start_pages,sxiv,wal,zathura} ~/.config/ &
cp dwm-dots/Xresources ~/.Xresources &
cp dwm-dots/xinitrc ~/.xinitrc &
cp dwm-dots/bashrc ~/.bashrc 



