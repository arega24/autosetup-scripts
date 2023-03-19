#!/bin/env sh

sudo xbps-install -Su
sudo xbps-install qemu virt-manager dnsmasq vde2 bridge-utils libguestfs

sudo ln -s /etc/sv/libvirtd /var/service/





