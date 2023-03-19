## Edit libvirtd.conf
```
sudo vim /etc/libvirt/libvirtd.conf 
```
List of eddits:

```
...

unix_sock_group = "libvirt"

...

unix_sock_ro_perms = "0777"

...

unix_sock_rw_perms = "0770"

```

Add yourself to the libvert group
```
sudo usermod -aG libvirt arega
```
