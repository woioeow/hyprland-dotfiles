# arch+hyprland问题

hyprland : error while loading shared libraries: libhyprutils.so.5:cannot open shared object file: no such file or directory
解决方案：

```bash
sudo paru -S hyprutils
sudo find / -name "libhyprutils.so",有则执行下行
sudo ln -s /usr/lib/libhyprutils.so /usr/lib/libhyprutils.so
```

## archlinuxcn-keyring 出问题

执行`pacman-key --lsign-key "farseerfc@archlinux.org"`

## makepkg

`sudo pacman -S base-devel fakeroot`
无法使用 root 用户执行