# Artix linux install guide for UEFI
This guide is for an artix linux encrypted install using runit as the init system.


see also:

https://unixsheikh.com/tutorials/real-full-disk-encryption-using-grub-on-artix-linux-for-bios-and-uefi.html

https://web.archive.org/web/20210515073858/https://www.rohlix.eu/post/artix-linux-full-disk-encryption-with-uefi/

https://wiki.artixlinux.org/Main/InstallationWithFullDiskEncryption
## Start
### ISO
https://artixlinux.org/download.php

Any iso can be used to make a base install.
I used stable cinnamon with runit. Using an iso with a graphical environment makes things easier for wifi connections and copyeng and pasting.

The iso can be flashed in a usb or you can use ventoy(worked for me).

https://www.ventoy.net/en/index.html

While booting from your live media, choose from CD/DVD/ISO option regardless of if you are using a CD/DVD or USB. Erros might occur using Stick/HDD option.

Open a terminal and run ``sudo su``
### Internet
Verify if there is and internet connection:
```
# ping gnu.org
```
### Keyboard
```
# ls /usr/share/kbd/keymaps/i386/qwerty/ | grep -i es
# loadkeys es
```

## Disk partition

### Locate disk
```
# fdisk -l
```

Can use the ``cfdisk`` tool

### Partition disk
```
# cfdisk /dev/sdX
```
Now give at least 512M to your UEFI partition and the rest for the root partition.


Exemple:
```
# fdisk -l /dev/sdX
Disk /dev/sda: 48 GiB, 51539607552 bytes, 100663296 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: EE4F2A1A-8E7F-48CA-B3D0-BD7A01F6D8A0

Device      Start       End   Sectors  Size Type
/dev/sdX1    2048    264191    262144  512M EFI System
/dev/sdX2  264192 100663262 100399071 47.9G Linux filesystem
```
### Encrypt volume 

Only encrypt the root partition
```
# cryptsetup luksFormat --type luks1 /dev/sdX2
```
Open the partition
```
# cryptsetup open /dev/sdX1 artixdisk
```
Install the filesystem in the root partition. I'm using XFS. Options (EXT4, XFS, Btrfs, etc.)
```
# mkfs.xfs /dev/mapper/artixdisk
```
Format the UEFI boot partition with the Fat filesystem
```
# mkfs.vfat -F32 /dev/sdX1
```
### Mount the partitions
```

```

Use the command lsblk -fp to list all the UUIDs of your system.



