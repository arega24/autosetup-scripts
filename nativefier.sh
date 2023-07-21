#!/usr/bin/env sh

# Void
#sudo xbps-install nodejs 
# Artix
#sudo pacman -S nodejs

sudo npm update -g 
sudo npm install -g nativefier 
mkdir -p ~/Documentos/Nativefier/ 
cd ~/Documentos/Nativefier/ 

sudo nativefier --name 'Lichess' 'lichess.org' 
sudo nativefier --name 'Piped' 'https://piped.kavin.rocks/' 
sudo nativefier --name 'Twitch' 'twitch.tv' 
sudo nativefier --name 'Prosperous Universe' 'https://prosperousuniverse.com/auth/login/?od=https://apex.prosperousuniverse.com/' 
sudo nativefier --name 'Odysee' 'https://odysee.com/' 
sudo nativefier --name 'Kick' 'https://kick.com/' 

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





