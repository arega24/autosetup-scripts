#!/usr/bin/env sh

# Void
#sudo xbps-install nodejs 
# Artix
sudo pacman -S nodejs npm

sudo npm update -g 
sudo npm install -g nativefier 
mkdir -p ~/Documentos/Nativefier/ 
cd ~/Documentos/Nativefier/ 

nativefier --name 'Lichess' 'lichess.org' 
nativefier --name 'Piped' 'https://piped.kavin.rocks/' 
nativefier --name 'Twitch' 'twitch.tv' 
nativefier --name 'Prosperous Universe' 'https://prosperousuniverse.com/auth/login/?od=https://apex.prosperousuniverse.com/' 
nativefier --name 'Odysee' 'https://odysee.com/' 
nativefier --name 'Kick' 'https://kick.com/' 
nativefier --name 'Syncthing' 'http://127.0.0.1:8384/' 
nativefier --name 'Duolingo' 'https://www.duolingo.com/' 
nativefier --name 'Github' 'https://github.com/arega24' 

mkdir -p ~/.local/share/applications/
cp -r ~/autosetup-scripts/nativefier/applications/* ~/.local/share/applications/

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





