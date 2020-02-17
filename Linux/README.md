# Linux

## Install 

- 參考 [Install.md](/NSTALL.md)

## Ubuntu 18.04 link OneDrive

- [OneDrive](https://www.maketecheasier.com/sync-onedrive-linux/)

## 常用 Tool

- [WSL 設定 Z shell (zsh)](https://poychang.github.io/note-windows-terminal/)
    - 由於 windows 會有些符號無法顯示zsh部分字型或圖案(windows 字型比較少，在 windows 多安裝 Powerline 就可以)，所以我選擇主題 bira，比較方便
    - 之後主體要修改就改 ~/.zshrc 檔案
    - 如果有使用 zsh 要小心, 原本新增 PATH 到 bashrc 也要新增到 zshrc, 不然 terminal 會讀不到 (ex: pyenv, pipenv)
    - 切換 bash 和 zsh 
        - Switch to bash: exec bash
        - Switch to zsh: exec zsh