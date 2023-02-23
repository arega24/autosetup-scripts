#!/bin/env sh

# run as sudo

xbps-install -S flatpak &
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


