# pyenv

## 安裝

- curl https://pyenv.run | bash
- git clone https://github.com/yyuu/pyenv.git ~/.pyenv
- echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
- echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
- echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

## pyenv 指令

- pyenv install -l: 查看目前可安裝 python 版本
    - ERROR
        - zipimport.ZipImportError: can't decompress data; zlib not available
    - Solution:
        - **Ubuntu 請先安裝**: sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

- pyenv version: 查看當前版本
- pyenv install 3.6.9: 安裝 3.6.9 版本
- pyenv local 3.6.9: 此專案使用 3.6.9 版本


## pipenv 指令

- pipenv --python /home/**username**/.pyenv/versions/3.6.9/bin/python3.6 shell : 指定使用哪個 python 建立環境

- pipenv sync : 安裝所有在 pipfile.lock 中的套件

- pipenv shell : 啟用環境

- pipenv install requests: 安裝 requests 套件

- pipenv install -e project_name/ : 將 Pipfile 檔案中的 project_name 資料夾新增成 package

- pipenv --rm: 刪除環境

- pipenv clean --verbose: 刪除不在 pipfile.lock 中的套件

## Reference
