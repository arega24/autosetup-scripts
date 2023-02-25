#!/bin/env sh

sudo xbps-install nix 
sudo ln -s /etc/sv/nix-daemon/ /var/service/ 
source /etc/profile 
nix-channel --add http://nixos.org/channels/nixpkgs-unstable
nix-channel --update
echo "Done!"

