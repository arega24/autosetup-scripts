#!/usr/bin/env sh

sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libvirt-runit
sudo ln -s /etc/runit/sv/libvirtd/ /run/runit/service/
