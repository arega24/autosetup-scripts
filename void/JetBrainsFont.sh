#!/bin/env sh

cd 
sudo xbps-install zip
xbps-fetch https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip & 
sleep 2
unzip Jet* 
sudo cp fonts/ttf/* /usr/share/fonts/TTF/





