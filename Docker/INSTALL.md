# Install Docker

## Windows Subsystem (WSL)

- 手動開啟 windows Hyper-V
    - 設定 -> 應用程式與功能 -> 程式與功能 -> 開啟或關閉 Windows 功能 -> 點選 Hyper-V

- 到 Docker 官網下載 Windows 版的 Docker 安裝。[下載連結](https://www.docker.com/products/docker-desktop)。
    - 下載 docker 需要先申請一個 docker 帳號，有點類似 github，在 docker 稱作 Docker hub，可以在 docker hub 中察看其他 image。下載畫面如下:

    ![](Image/Image1.png)

- 在 WSL 上安裝 Docker

    ```
    sudo apt install docker.io
    sudo usermod -aG docker $USER
    ```
- 連接 WSL docker client 和 Windows 的 docker engine
    - WSL 本身無法支援 docker engine  (這也是為什麼要安裝 windows docker 的原因)

- 打開 Windows 下 Docker 的設定界面，將 Expose daemon on tcp://localhost:2375 without TLS 的選項打開。

    ![](Image/Image2.png)

- 打開 WSL 的 Bash，用編輯器修改 **~/.bashrc** 檔案，加入下列內容：
    ```
    PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
    alias docker=docker.exe
    alias docker-machine=docker-machine.exe
    alias docker-compose=docker-compose.exe
    export DOCKER_HOST="tcp://localhost:2375"
    ```

- 在 sudoer 中加入 DOCKER_HOST 這個環境變數到預設環境中，先執行 **sudo visudo** 然後加入下面這一行：
    ```
    Defaults env_keep += "DOCKER_HOST"
    ```

- 重開 WSL 的 Bash (或是執行 source ~/.bashrc)

- WSL 執行 **docker run hellow-world**，會出現如下畫面:

    ![](Image/Image3.png)


## Windows

- 電腦無法裝

    - 本次 docker 安裝是在 windows8 環境下操作，不滿足基本環境需求