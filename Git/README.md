# 在 Ubuntu 上安裝 Git

首先你要先確定你的 apt-get 套件管理已經升級過了，透過下列的命令升級：

```
sudo apt-get update
```

接著直接透過 apt-get 安裝 git：

```
sudo apt-get install git
```

## 設定 ssh key

產生  ssh key 指令如下:
```
ssh-keygen
```

複製 id_rsa.pub 的內容到 github or gitlab...等
```
cat ~/.ssh/id_rsa.pub
```

到 github or gitlab 設定頁面將剛剛複製的金鑰輸入進去

## 多個帳號同時使用

由於有些東西是要推送到私人的 github，因此同一台電腦可能會因為不同的 repository 需要切換不同的 github 帳號。具體作法是取消 global user 和 email 設定，針對每個 repository 去設定 user 和 email。

- 取消 Global 設定
  - $git config — global — unset user.name 
  - $git config — global — unset user.email
- 設定各 Repository 的 User 資料
  - $git config  user.email "userName@address"     
  - $git config  user.name "userName"

## submodule

- 新增：開發新專案有時候需要使用到其他專案的程式，可以透過 git submodule 來達到此目的，並可以隨時同步最新的程式碼
  ```
  git submodule add <remote 路徑>
  ```

- 同步
  ```
  git submodule update --init --recursive
  ```

- 刪除：
  - 先把 submodule 目錄從版本控制系統移除
    ```
    git rm --cached /path/to/files
    rm -rf /path/to/files
    ```
  - 修改 .gitmodules, 把不用的 submodule 刪掉
  - 修改 .git/config 的內容, 把不用的 submodule 刪掉

## Pull Request SOP

- 複製（Fork）專案到自己的 gtihub
- Clone fork 過來的 repository 到 local
- 修改完推回自己 github 
- create pull request 給原來作者

- 同步原作者的 code
  - 設定原作者遠端連結
    - git remote add **設定原作者遠端節點名稱** **原作者 github link**
        - Ex: git remote add dmlc-xgboost https://github.com/dmlc/xgboost.git
    - 查看遠端節點設定是否成功: git remote -v
  - 抓取源專案內容 
    - git fetch **設定原作者遠端節點名稱**
        - Ex: git fetch dmlc-xgboost
    - git merge **設定原作者遠端節點名稱**/master
        - Ex: git merge dmlc-xgboost/master
  - 推回自己專案
    - git push origin master