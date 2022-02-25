# Open shift

## 常見名詞

- NameSpace

- Build
    - 主要有三種模式
        - docker build
        - source-to-image(S2I) build
            - 如果服務沒又太複雜可以考慮使用，另外在直接寫 docker file 之前也可以考慮找找看有沒有現成的 S2I 可以使用
        - customer build

- Service
    - 實際要將 Pod 對外開放的時候，用來做內外網路對應的物件，外面進來的流量就是透過 Serivce 轉發到 Pod
    - 容器運行的時候是在運行在 Pod 內部的一個網路，與外部隔離。所以需要創建一個 Service（SVC），把容器內部的網路暴露出來，沒有建立 Service 則 Pod 就只能內部通訊
    - Service 是跨 Node 的，他會依照 SELECTOR 來抓取所有的 Pods
    - 當建立 service 時，都會被分配到一個 IP 地址

- Route
    - 每個 route 會與 Service 相關聯，並綁定一個外部可達到的域名

- Label


- Deployment vs DeploymentConfig

- POD
    - k8s 最小單位，container 是包含在 pod 中
    -

- Container
    - image 容器化後會恢復到這 image 初始的狀態，**並且會獲取一個新的ip位置**
        - 這也是為什麼如果服務需要對外會需要設定 service

## 常見語法

- oc login -u **user name** -p **password** **server path**
    - ex: oc login -u developer -p developer https://api.crc.testing:6443

- oc new-project **project name**:建立 **project name** project

- oc project: 查看當下在哪個 project

- oc get pods: 列出帳號下所有 pod

- oc logs **pod name**: show  **pod name** log
