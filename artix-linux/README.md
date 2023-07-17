# Artix linux install guide for UEFI
This guide is for an artix linux encrypted install using runit as the init system.


see also:

https://unixsheikh.com/tutorials/real-full-disk-encryption-using-grub-on-artix-linux-for-bios-and-uefi.html

https://web.archive.org/web/20210515073858/https://www.rohlix.eu/post/artix-linux-full-disk-encryption-with-uefi/

https://wiki.artixlinux.org/Main/InstallationWithFullDiskEncryption

https://wiki.artixlinux.org/Main/Installation

https://wiki.archlinux.org/title/Network_configuration#Set_the_hostname
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
ping gnu.org
```
### Keyboard
```
ls /usr/share/kbd/keymaps/i386/qwerty/ | grep -i es
loadkeys es
```

## Disk partition

### Locate disk
```
fdisk -l
```

Can use the ``cfdisk`` tool

### Partition disk
```
cfdisk /dev/sdX
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
cryptsetup luksFormat --type luks1 /dev/sdX2
```
Open the partition
```
cryptsetup open /dev/sdX1 artixdisk
```
Install the filesystem in the root partition. I'm using XFS. Options (EXT4, XFS, Btrfs, etc.)
```
mkfs.xfs /dev/mapper/artixdisk
```
Format the UEFI boot partition with the Fat filesystem
```
mkfs.vfat -F32 /dev/sdX1
```
### Mount the partitions
```
mount /dev/mapper/artixdisk /mnt

mkdir -p /mnt/boot/efi
mount /dev/sdaX1 /mnt/boot/efi
```

## Install Base system
### Change mirrors (optional)
If you want you can select the Pacman mirrors by placing the ones you prefer in the top:
```
vi /etc/pacman.d/mirrorlist
```

### Install the base system
In this case we are using runit as the init system
```
basestrap /mnt base base-devel runit elogind-runit
```

### Install a kernel 
```
basestrap /mnt linux linux-firmware
```
### Generate and verify fstab
```
fstabgen -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

## chroot
### chroot into new system

```
artix-chroot /mnt
```
### Install a text editor
```
pacman -S neovim
```
Can also install other usefull/needed packages
```
pacman -S networkmanager networkmanager-runit   <- network management
          cryptsetup lvm2 lvm2-runit            <- for decreption of the disk
          grub efibootmgr                       <- grub and UEFI support
```

### Configure the system clock
```
echo KEYMAP=dk > /etc/vconsole.conf
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
```
### Configure localization
In this file uncomente your locale(can be multiple options for the same location), then run ``locale-gen``
```
nvim /etc/locale.gen
locale-gen
```
#### To set the locale systemwide
Add this to ``/etc/locale.conf``
```
 export LANG="en_US.UTF-8"     <-- localize in your languages
 export LC_COLLATE="C"
```
### Hostname
 
```
echo "my-hostname" > /etc/hostname
cat /etc/hostname
```

### Local network hostname resolution
Edit ``/etc/hosts`` and add The following:
*Note that the space is a tab*
```
127.0.0.1         localhost
::1               localhost
127.0.1.1         my-hostname.localdomain my-hostname
```
### Add and edit users 
```
passwd       <- to set root passwd
useradd -G wheel -m username
passwd username
```
### mkinitcpio
The ``/etc/mkinitcpio.conf`` file enables to set up various kernel parameters. Within the **HOOKS** part, the **encrypt lvm2** needs to be put between **block** and **filesystems** keywords in order to enable the Full Disk Encryption. It may also be useful to include the resume keyword to enable suspend to disk options. However, this may not work at all times, such as with hardened kernels. 

Insert **encrypt** and **resume**
*Note that lvm2 shoud be there as well*
```
 HOOKS="base udev autodetect modconf block keyboard keymap consolefont lvm2 filesystems fsck"
```
should become
```
 HOOKS="base udev autodetect modconf block encrypt keyboard keymap consolefont lvm2 resume filesystems fsck"
```

Update mkinitcpio
*linux is the kernel I installed. If you install linux-lts or any other you should the name to your's*
```
mkinitcpio -p linux
```
## Grub installation
### Config grub
Use the command ``lsblk -fp`` to list all the UUIDs of your system. Need to exit chroot to run this command.

*still in chroot*
```
nvim /etc/default/grub
```
Edits to the file
```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet cryptdevice=UUID=xxx:cryptlvm root=UUID=yyy"
GRUB_ENABLE_CRYPTODISK=y              <- uncoment this line
```
*cryptlvm can be named diferently*
*root can also be changed to other string*
xxx = UUID of the root partition (sdX2)
yyy = UUID of the artixdisk partition (might show below the sdX2 when you run the lsblk command)

### Install the grub boot loader
Command for UEFI
Make shure it is instaled into the disk ``/dev/sdX`` and not any partition: ``/dev/sdX1`` or ``/dev/sdX2``
```
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

### Make grub configuration
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Finish
Unmount drives and revoot
```
exit                <- to exit chroot

umount -R /mnt      <- unmounts all disk drives
reboot
```
