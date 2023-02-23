# Instalation

## Manual instalation
https://docs.voidlinux.org/installation/guides/chroot.html

## Encrypted instalation
https://docs.voidlinux.org/installation/guides/fde.html

**Be aware that grub uses en_US keyboard layout by default. Idk how to chang it so set a disk password WITHOUT special caracters.**

### keyboard in tty


```
loadkeys <lang ex: fr>
```

### can edit this part for your location
ex:
```
[xchroot /mnt] # echo "LANG=es_ES.UTF-8" > /etc/locale.conf
[xchroot /mnt] # echo "ES_ES.UTF-8 UTF-8" >> /etc/default/libc-locales
[xchroot /mnt] # xbps-reconfigure -f glibc-locales
```

### Disk preparation

- fdisk for partition table  
- cfdsik to create partitions  

#### Use XFS 

- xfs is faster than ext4. ext4 with no journaling is faster but it comes by default with journaling on  
- https://wiki.archlinux.org/title/file_systems  
- https://invidious.snopyta.org/watch?v=G785-kxFH_M  
- (openZFS is faster but it is oriented for servers and the lincense is sketchy bc of oracle(ZFS creator))  



# After instalation

## time and hardware clock

``$ doas ln -sf /usr/share/zoneinfo/<timezone> /etc/localtime``

and edit `/etc/rc.conf` file.

## Internet connetion

https://docs.voidlinux.org/config/network/index.html

### configure ethernet conection
```
# ip link show

2: enp3s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
        link/ether ff:ff:ff:ff:ff:ff brd ff:ff:ff:f

# cp -R /etc/sv/dhcpcd-eth0 /etc/sv/dhcpcd-enp3s0
# sed -i 's/eth0/enp3s0/' /etc/sv/dhcpcd-enp3s0/run
# ln -s /etc/sv/dhcpcd-enp3s0 /var/service/
# ping gnu.org

```

### Keyboard

#### on xorg   
```
install setxkbmap
$ doas xbps-install setxkbmap
		  		  
then run:
$ setxkbmap <lang ex: fr>
```
#### on tty  

```
$ doas loadkeys fr
```


## Add user  
https://wiki.archlinux.org/title/users_and_groups  

```
# useradd -m -G wheel,floppy,audio,video,mail,storage,kvm,users,xbuilder -s /bin/bash arega
# passwd arega
```

### sudo

- Add to user to `/etc/sudoers`  `arega ALL=(ALL) ALL`
- add line `` arega ALL=(ALL:ALL) NOPASSWD:/home/arega/.config/scripts/rofi-powermenu.sh `` for rofi-powermenu to run

### doas 

in `` /etc/doas.conf `` add
```
permit arega as root 
```

## change root passwd in case you forguet

- https://invidious.snopyta.org/watch?v=hnR3rkXev50

```
# cryptsetup luksOpen /dev/sda1 voidvm

# lvdisplay
(needs to me avaialable)

 # lvchange -ay /dev/voiddisk/root
 (to make avaialable)
 
 # mount /dev/voiddisk/root /mnt
 # mount /dev/nvme1n1p1 /mnt/boot/efi
 
 # xchroot /mnt
 [xchroot /mnt] # passwd root
```
