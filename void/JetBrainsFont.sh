#!/bin/env sh

cd 
doas xbps-install zip
xbps-fetch https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip & 
unzip Jet* 
cp fonts/ttf/* /usr/share/fonts/





