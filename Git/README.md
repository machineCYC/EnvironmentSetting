# 在 Ubuntu 上安裝 Git

首先你要先確定你的 apt-get 套件管理已經升級過了，透過下列的命令升級：

```
sudo apt-get update
```

接著直接透過 apt-get 安裝 git：

```
sudo apt-get install git
```


## 多個帳號同時使用

由於有些東西是要推送到私人的 github，因此同一台電腦可能會因為不同的 repository 需要切換不同的 github 帳號。具體作法是取消 global user 和 email 設定，針對每個 repository 去設定 user 和 email。

- 取消 Global 設定
  - $git config — global — unset user.name 
  - $git config — global — unset user.email
- 設定各 Repository 的 User 資料
  - $git config  user.email "userName@address"     
  - $git config  user.name "userName"