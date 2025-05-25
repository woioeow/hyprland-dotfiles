
# Hyprland 安装及配置

## Hyprland 安装

```bash
paru -Sy hyprland-git waybar rofi mako kitty firefox nemo fontconfig \
cinnamon-translations  sddm hyprlock hypridle hyprpaper hyprland-qtutils swayimg copyq  \
qt5-wayland qt6-wayland wl-clipboard xdg-desktop-portal-hyprland swaybg swayidle \
gcc g++ gdb go  gnome-tweaks yazi qt6-5compat qt6-declarative auto-cpufreq \
lsd neofetch htop lolcat redshift brightnessctl 


sudo systemctl enable sddm --now
sudo systemctl enable auto-cpufreq --now
```

hyprland 初始快捷键：
    win+q 召唤终端
    win+m 关闭桌面

## 连接 android 手机

```bash
paru -S mtpfs jmtpfs
sudo pacman -Sy gvfs-mtp

sudo reboot
```

## 安装录屏截图软件

```bash
paru -S obs-studio grim cliphist slurp ksnip 
```

文件 -> 设置 -> 输出 -> 录制 -> 视频编码器 -> 软件 (x264)

## 压缩软件

```bash
paru -S unzip zip 7zip
```

## 安装字体

```bash
paru -S noto-fonts-cjk nerd-font wqy-microhei ttf-arphic-uming \
adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts \
wqy-microhei wqy-microhei-lite wqy-bitmapfont ttf-arphic-ukai \
ttf-arphic-uming noto-color-emoji-fontconfig ttf-dejavu \ 
cantarell-fonts otf-apple-pingfang otf-apple-pingfang-ui \
ttf-harmonyos-sans wps-office-fonts ttf-ms-fonts  ttf-wps-fonts \
ttf-font-awesome
```

```bash
#刷新系统字体
sudo fc-cache -fv

sudo cp /usr/share/hypr/hyprland.conf $HOME/.config/hypr

#查看系统字体
fc-list : family > test.txt
```

## 文件管理美化

```bash
paru -S gnome-tweaks arc-gtk-theme
```

## zathura

```bash
sudo pacman -S zathura zathura-pdf-mupdf 
paru -S zathura-epub-mupdf 
```

## 输入法

```bash
paru -S fcitx5-git fcitx5-configtool fcitx5-rime fcitx5-qt5 fcitx5-theme-macos12
```

在`/etc/environment`文件中输入以下内容

```bash
QT_IM_MODULE=fcitx5
XMODIFIERS=@im=fcitx5
SDL_IM_MODULE=fcitx5
```

主题右击配置、附加组件里找到经典用户界面，点配置，下拉找到主题选 macos15-dark

## oh-my-zsh

```bash
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
#高亮 
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \ 
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
#自动补全 
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \ 
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

vim .zshrc
#找到
plugins=(git)
#在git后添加zsh-syntax-highlighting zsh-autosuggestions
```

## 安装代码编辑器

```bash
paru -S visual-studio-code-bin pycharm-community-edition
```

## 娱乐软件

```bash
paru -S clash-verge baidunetdisk-bin linuxqq wechat steam bilibili-bin
```

## 办公软件

```bash
paru -S wps-office-mui-zh-cn wps-office-mime-cn wps-office-cn
```

## 文件光标图标

> 使用 Naroz-vr2b-Linuxi 主题

```bash
sudo cp -r ~/Downloads/Naroz-vr2b-Linux/Naroz-vr2b /usr/share/icons/

#在~/.config/hypr/hyprland.conf添加
env = XCURSOR_THEME,Naroz-vr2b

hyprctl reload
sudo reboot
```

## 驱动

### 声卡

```bash
#声卡
paru -S pipewire pipewire-audio pipewire-pulse pipewire-alsa wireplumber pipewire-jack pavucontrol alsa-utils nas \
alsa-firmware alsa-ucm-conf alsa-card-profiles alsa-plugins alsa-topology-conf
```

### 显卡

```bash
#显卡
paru -S mesa intel-media-driver libva vulkan-intel vulkan-tools pavucontrol\
intel-media-driver intel-hybrid-codec-driver-git   
```

### 自动挂载 U 盘

```bash
paru -S udev udiskie
```

### 蓝牙

```bash
paru -S bluez bluez-utils blueman

sudo systemctl enable --now bluetooth
```

### 摄像头

```bash
paru -S cheese v4l-utils
```

### 打印机

```bash
paru -S cups system-config-printer

sudo systemctl enable --now cups
```

## 风扇控制

```bash
paru -S nbfc-linux-git
```

### 功耗控制

```bash
paru -S thermald tlp tlpui tlp-rdw

sudo systemctl enable --now thermald
sudo systemctl enable --now tlp.service
sudo systemctl mask system-rfkill.service
sudo syatemctl mask system-rfkill.socket
sudo tlp start
```

### 更新固件

```bash
sudo pacman -S fwupd

sudo fwupdmgr refresh --force

```

## 设置开机动画

> arch-mac-style.plymouth 使用这个主题

```bash
paru -S plymouth

cd ~/Downloads/arch-mac-style

sudo mkdir -p /usr/share/plymouth/themes/arch-mac-style

sudo cp -r ./arch-mac-style.plymouth ./resources ./screenshot.png /usr/share/plymouth/themes/arch-mac-style/

sudo vim /etc/mkinitcpio.conf
HOOKS = (base udev plymouth ...)

sudo vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT行后添加
quiet splash loglevel=3 rd.udev.log_priority=3 vt.global_cursor_default=0

mkinitcpio -p linux-zen

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo plymouth-set-default-theme -R arch-mac-style

sudo reboot
```

## github ssh 下载上传

```bash
ssh-keygen -t ed25519 -C "1002464042@qq.com"
cat ~/.ssh/id_ed25519.pub

#登录hgitub,点击头像,选择Setting,旁边的侧边栏找到SSH and GPG keys, 
#点击SSH keys右边的New SSH keys按钮，密钥名称随便给一个，把公钥输入进入,确定

#完成后测试
ssh -T git@github.com
```

出现以下内容表示成功
Hi wcisnsc! You've successfully authenticated, but GitHub does not provide shell access.

## lazyvim

```bash
paru -S neovim
git clone --depth=1 https://github.com/LazyVim/starter ~/.config/nvim
rm -fr ~/.config/nvim/.git

echo alias vim=\'nvim\' >> .zshrc
source .zshrc
```

## ufw 防火墙

```bash
sudo pacman -S ufw
sudo systemctl enable --now ufw

# 操作
sudo ufw allow 3389/tcp
sudo ufw allow 3389/udp
sudo ufw reset
sudo ufw status
sudo ufw default deny
```

## nvm nodejs npm 安装配置

> nvm 是 node、npm 版本控制软件
> 只用下载 nvm, npm 和 nodejs 可以用 nvm 下载相应版本

```bash
paru -S nvm

#换源
nvm node_mirror https://npmmirror.com/mirrors/node/
nvm npm_mirror https://npmmirror.com/mirrors/npm/

#下载版本
nvm i 20.5.1
#查看版本
nvm list 
#使用版本
nvm use 20.5.1

#npm
#换源-淘宝云
npm config set registry https://registry.npmmirror.com/
#查看当前源
npm get registry

npm i hexo-cli -g #全局下载hexo-cli
```

## QEMU + KVM + Virt-Manager

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo

sudo pacman -Syu qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

sudo systemctl enable --now libvirtd

# 添加当前用户到libvirt和kvm组
sudo usermod -aG libvirt,kvm $USER

lsmod | grep kvm

#应该有以下类似输入
#kvm_intel 或 kvm_amd
#kvm

virt-manager

# 配置网络
sudo pacman -S bridge-utils
# 设置桥接
# 我只是拿来安装windows做作业，没有这个需求
sudo nvim /etc/libvirt/qemu.conf
```

## grub 主题

[grub 下载地址](https://www.gnome-look.org/browse?cat=109)
> 使用 Elegant-mojave-window-grub-themes 主题

```bash
#下载后的主题使用
tar -Jxf tar.xz包
#进入1080p包执行以下命令，即可安装成功
./install.sh
#测试
sudo reboot
```

## 给 U 盘安装 ventoy

### 格式化 U 盘

格式化 U 盘为 exfat 格式

```bash
sudo pacman -S exfatprogs

sudo mkfs.exfat u盘路径
```

使用 mkfs 命令需要 root 权限，只能对单个分区进行格式化
格式化之前需要先`sudo umount /dev/sda1`
使用`sudo cfdisk /dev/sda`,删除多余分区
> 这步是因为可能 U 盘之前当过启动盘，会多一个 EFI 分区
> 注意 sda1 是分区，sda 是 U 盘
使用 cfdisk 工具后，U 盘会重新挂载这时候需要再执行`umount`命令
再执行`sudo mkfs.exfat /dev/sda1`

使用`lsblk -f`可查看分区格式

### ventoy

[ventoy 下载地址](https://www.ventoy.net/cn/download.html)

```bash
cd ventoy-1.1.05
#安装ventoy
sudo ./Ventoy2Disk.sh -i U盘
##例如
sudo ./Ventoy2Disk.sh -i /dev/sda
#更新Ventoy
sudo ./Ventoy2Disk.sh -u /dev/sda
#查看
lsblk 
```

安装好后可以把镜像文件拖进 U 盘了

## 动态壁纸

```bash
paru -S mpvpaper-git

#在~/.config/hypr/hyprland.confx添加
exec-once=mpvpaper -o "no-audio --loop-playlist" '*'  "$HOME/Videos/LiveWallpaper/Japanese Autumn Leaves.mp4"
```
