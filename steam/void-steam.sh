#!/bin/env sh

sudo xbps-install -Sy void-repo-nonfree
sudo xbps-install -Sy void-repo-multilib
sudo xbps-install -Sy void-repo-multilib-nonfree
sudo xbps-install -S

#wine
sudo xbps-install wine wine-32bit

sudo xbps-install libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit
sudo xbps-install steam xboxdrv





