#!/bin/env sh

sudo pacman -S flatpak 
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo 

