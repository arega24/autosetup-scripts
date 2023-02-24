# autosetup-scripts

- for nix pkgs and nativefier webapps you might add files on ``~/.local/share/applications``
- ex:

lichess.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Exec=/home/arega/Documentos/Nativefier/Lichess-linux-x64/Lichess
Name=Lichess
Comment=Lichess.org online chess
```
### nix
(nix amplifies repos for trusted apps. Flatpak can be used for extra protection for sertain applications ex:discord, zoom, ...)
- nix stores this file in this dir so you can symlink it
dir ex: ``/nix/store/q1xkq37y32vaqnam0fqphcvr64b6my0b-librewolf.desktop/share/applications/librewolf.desktop``

```
$ ln -s /nix/... ~/.local/share/applications/
```

### nativefier
Nativefier stores binary in the created folder so add to the .desktop file as the exemple above.
