# Archv 安装

## 分区安排

`fdisk 硬盘绝对路径` or `cfdisk 硬盘绝对路径`

1. 引导分区 (fat32)：512M
2. swap 分区 (swap)：8G
3. \分区 (btrfs)：100G
4. Home 分区 (btrfs)：剩余容量

## 安装应用

```bash
pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware interl-ucode \
btrfs-progs mdadm  sof-firmware modemmanager vim man-db man-pages \
texinfo openssh networkmanager sudo zsh git fakeroot go 
```

下面这几个不用装
> nano lvm2 linux-firmware-marvell broadcom-wl-dkms

## 安装 paru

```bash
git clone depth=1 https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
