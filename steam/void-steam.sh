#!/bin/env sh

sudo xbps-install -Sy void-repo-nonfree
sudo xbps-install -Sy void-repo-multilib
sudo xbps-install -Sy void-repo-multilib-nonfree
sudo xbps-install -S

sudo xbps-install libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit
sudo xbps-install steam





