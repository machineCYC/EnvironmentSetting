# Linux

Linux distribution 下有分很多種 UI，比如:

- CentOS
- Debian
- Mint
- Ubuntu
- 等等

在這我們挑選一個比較被廣泛使用的 Ubuntu 來安裝。

## Install

- 參考 [Install.md](https://github.com/machineCYC/EnvironmentSetting/blob/master/Linux/INSTALL.md)

## Ubuntu 18.04 link OneDrive

- [OneDrive](https://www.maketecheasier.com/sync-onedrive-linux/)

## 常用 Tool

- [WSL 設定 Z shell (zsh)](https://poychang.github.io/note-windows-terminal/)
    - 由於 windows 會有些符號無法顯示zsh部分字型或圖案(windows 字型比較少，在 windows 多安裝 Powerline 就可以)，所以我選擇主題 bira，比較方便
    - 之後主體要修改就改 ~/.zshrc 檔案
    - 如果有使用 zsh 要小心, 原本新增 PATH 到 bashrc 也要新增到 zshrc, 不然 terminal 會讀不到 (ex: pyenv, pipenv)
    - 切換 bash 和 zsh
        - 當下 terminal
            - Switch to bash: exec bash
            - Switch to zsh: exec zsh
        - 永久更改
            - chsh -s /bin/bash
            - chsh -s /bin/zsh

- Terminal 顯示 branch name
    - 在.bashrc 新增如下
    ```
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
    ```
    - 更多樣式更多樣式 [參考link](https://gist.github.com/justintv/168835)

- [Ubuntu - 筆電關上不休眠](https://blog.cashwu.com/blog/ubuntu-laptops-close-lcd-not-hibbernate/)

- [Linux SSH login setting](https://blog.gtwang.org/linux/linux-ssh-public-key-authentication/)

- fail2ban 防止 ssh 暴力登入攻擊
    - [[教學] 使用fail2ban防止暴力登入攻擊](https://xenby.com/b/107-%E6%95%99%E5%AD%B8-%E4%BD%BF%E7%94%A8fail2ban%E9%98%B2%E6%AD%A2%E6%9A%B4%E5%8A%9B%E7%99%BB%E5%85%A5%E6%94%BB%E6%93%8A)


- 防火牆設定
    - [ufw：簡易防火牆設置](https://noob.tw/ufw/)

## 常見 Bug

- Linux 常常會有 GUI 介面無法展示的問題, ex: gitk, matplotlib plt.show ...
    - windows subsystem linux, 參考如下解法
        - [Show matplotlib plots in Ubuntu (Windows subsystem for Linux)](https://github.com/machineCYC/EnvironmentSetting/blob/master/Linux/INSTALL.md)

- [User Acccount can not use sudo](https://uiop7890.pixnet.net/blog/post/29385923)