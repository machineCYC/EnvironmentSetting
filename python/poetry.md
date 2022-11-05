## Poetry

## Install (WSL2)

```
# install
curl -sSL https://install.python-poetry.org | python3 -

# set up path
echo 'export PATH=$PATH:$HOME/.local/bin"' >> ~/.bashrc
```

if not set up poetry path, you need to use $HOME/.local/bin/poetry to run poetry syntax

poetry will install in the below folder

- $HOME/.local/bin for Unix
- %APPDATA%\Python\Scripts on Windows



## syntax

- poetry init: 在專案資料夾初始化 poetry
- poetry env use python3.7: 指定環境使用 python3.7(前提是電腦中有指定的python3.7 版本)
- poetry shell: 啟動 poetry python 環境
- exit: 離開 poetry python 環境
- poetry add black: 安裝 black lib
- poetry install: 安裝 poetry.lock 中的 lib (包括當下 folder 加入python path)
- poetry env remove python: 移除當下python 環境
- poetry export -f requirements.txt -o requirements.txt --without-hashes --dev: 產生 requirements.txt file


## Reference

- [](https://blog.kyomind.tw/python-poetry/)