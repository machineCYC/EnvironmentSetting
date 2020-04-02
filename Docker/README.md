# Docker

- image: 指的是已經打包好的環境，但是還沒有跑起來，就是一堆檔案而已
- container: 則是把 image 跑起來之後產生的 instance

## 安裝

- [參考連結](https://github.com/machineCYC/EnvironmentSetting/blob/master/Docker/INSTALL.md)

## 指令

docker image ls: 列出目前電腦擁有的 image

docker ps: 檢查 docker 是否有在執行

docker pull ubuntu: 從 docker hub pull 最新版的 ubuntu

docker run -it ubuntu bash: 把 ubuntu 的 image 跑起來變成 container，-it 是為了讓我們進到這個 container 的 shell 下指令

docker run: 一般執行 docker 方式，通常只會執行一個 container (一個應用)

docker compose: 啟動多個 container，避免很多個應用要一個一個執行 docker run

## Dockerize 應用程式

- 目標: 把程式碼跟想要的環境打包起來，變成一個 image，之後不管到哪一台機器上，只要有裝 Docker 而且有這個 image 就可以把你的程式跑起來

- SOP
    - Step0: 新增 Dockerfile
        - 為了把環境跟程式碼包成一個 image，我們需要一個 Dockerfile 把打包的步驟寫在裡面
    - Step1: 找到適合的 base image
        - Docker 的 image 是一層一層疊加上去的，所以我們需要先在 Docker Hub 上選擇一個 base image，然後再慢慢把它加工成我們要的
    - Step2: copy 原始碼
    - Step3: 安裝 dependencies
    - Step4: 設定 initial command
        - 環境、程式碼、dependencies 都準備好了，只剩把程式跑起來，這裡會用到 CMD 設定這個 image 被跑起來時的預設指令
    - Step5: build image

- Dockerfile
    - 指令
        - **FROM** python: 以 python 為 base image
        - **RUN** mkdir /project: 執行 mkdir /project
        - **COPY** A.py /project/: 把 A.py 複製到 project 裡面
        - **WORKID** /project/: 切換到 project 資料夾下
        - **CMD**

## Reference

- [Ubuntu inatall](https://blog.gtwang.org/virtualization/docker-basic-tutorial/)

- [docker-tutorial](https://github.com/twtrubiks/docker-tutorial)

- [dockerize application](https://larrylu.blog/step-by-step-dockerize-your-app-ecd8940696f4)