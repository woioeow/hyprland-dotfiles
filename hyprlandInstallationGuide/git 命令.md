# git 命令

## 代理

```bash
#查看有没有设置代理
git config --global --get http.proxy
git config --global --get https.proxy

#禁用代理
git config --global --unset http.proxy
git config --global --unset https.proxy

#设置代理
git config --global http.proxy 'socks5h://127.0.0.1:7890'
git config --global https.proxy 'socks5h://127.0.0.1:7890'
```

## git

```bash
git init .
git add .
git commit -m "first commit"
git branch -M main
git remote add origin <url>
git push -u origin main

git clone --depth=1 <url>

git config --global user.name <github name>
git config --global user.email <name@host.com>
```
