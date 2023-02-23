#!/bin/env sh

## RUN AS SUPER USER

xbps-install nodejs &
npm update -g &
npm install -g nativefier &
mkdir -p ~/Documentos/Nativefier/ &
cd ~/Documentos/Nativefier/ &

doas nativefier --name 'Lichess' 'lichess.org' &
doas nativefier --name 'Piped' 'https://piped.kavin.rocks/' 
doas nativefier --name 'Twitch' 'twitch.tv' 


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





