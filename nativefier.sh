#!/bin/env sh

sudo xbps-install nodejs 
sudo npm update -g 
sudo npm install -g nativefier 
mkdir -p ~/Documentos/Nativefier/ 
cd ~/Documentos/Nativefier/ 

sudo nativefier --name 'Lichess' 'lichess.org' 
sudo nativefier --name 'Piped' 'https://piped.kavin.rocks/' 
sudo nativefier --name 'Twitch' 'twitch.tv' 


# Exe of a desktop entry file 
#
# ~/.local/share/applications/lichess.desktop
#
# [Desktop Entry]
# Version=1.0
# Type=Application
# Exec=/home/<user>/Documents/Nativefier/Lichess-linux-x64/Lichess
# Name=Lichess
# Comment=Lichess.org online chess





