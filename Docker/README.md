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

docker run -it --rm **image_name**: 進到 docker container 裡面, **--rm** 離開時順便關閉

docker compose: 啟動多個 container，避免很多個應用要一個一個執行 docker run

docker build -t **image_name**:**tag_name** . : 透過 Dockerfile build image, image 名稱為 image_name, tag 為 tag_name

docker build -f **docker_file_name** -t **image_name**:**image_tag** . : 指定 docker_file_name build image, image 名稱為 image_name, tag 為 tag_name

docker log XXXX: 查看 XXX log

docker rm **container_id**: 刪除 container

docker rmi **image_id**: 刪除 image

docker exec -it **image_name** bash: 進到 **image_name** 的 bash

docker exec -it **container_name** **server_name**: 進到 **container_name** 的 **server_name** 服務
    - ex: docker exec -it mysql_mysql_1 mysql -u user -p

docker cp **file_path** **container_name**:**container_path**: 複製 **file_path** 到這個 continer **container_name** 的這個地方 ***container_path**

docker logs **container_id**: 展示 **container_id** 中的 log

echo "$PASSWORD" | docker login -u **user_name** --password-stdin: 透過環境變數登入 docker 帳號(-p 這參數在未來會不能用)

docker login -u **user_name**: 兩段式登入，在打密碼(可用token 取代密碼)

docker logout: 登出 docker 帳號

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

## Docker compose

- Docker Compose 是一個工具可以讓你可以透過一個指令就可以控制所有專案（project）中所需要的 services
- Docker Compose 是用 YAML 檔案格式來描述和定義 project 中 services 運作關係
- 指令
    - docker-compose -f **docker-compose yml file name** up -d: 啟動 docker-compose 上所有 services, 其中 **-d** 代表在背景執行
	- docker-compose -f **docker-compose yml file** down: 關閉 docker-compose 上所有 services


## Swarn

- 指令
    - docker swarm init: swarm 初始化
    - docker stack deploy -c **XXX.yml file** **stack_name**: 啟動XXX.yml 服務且 stack 名稱為 stack_name
        - ex: docker stack deploy -c portainer.yml por: 啟動 portainer 和 ui 介面
    - docker swarm join-token worker
        - 在 manager 機器 show 連結語法, 讓 worker 可以透過這個語法跟 manager 連結

    - docker swarm leave --force : 結束 swarm

## Reference

- [Ubuntu inatall](https://blog.gtwang.org/virtualization/docker-basic-tutorial/)

- [docker-tutorial](https://github.com/twtrubiks/docker-tutorial)

- [dockerize application](https://larrylu.blog/step-by-step-dockerize-your-app-ecd8940696f4)

- [Docker 中刪除 Images 鏡像 及 Containers](https://www.opencli.com/linux/docker-delete-images-containers)

- [Docker login 驗證錯誤解決辦法](https://ug.epurs.com/post/docker-login-error-saving-credentials/)

- [Setting github secrets with docker/build-push-action](https://github.com/docker/build-push-action/issues/390)