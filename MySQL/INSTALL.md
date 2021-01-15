# 安裝 MySQL

## Linux

直接使用 docker image, 參考 docker compose ymal file

## Windows - Download MySQL 5.7.21

MySQL的官方網站目前提供一個完整的安裝程式，在Windows平台只要下載與安裝一個檔案，就包含資料庫伺服器和所有需要的工具軟體。你可以到這個連結準備開始下載：

- [MySQL官方網站](https://dev.mysql.com/downloads/windows/installer/)

進入這個網站以後，下載紅框的部分，然後參考下面的說明，下載與儲存完整的安裝檔案：

![](Image/Image1.png) 


下載完成後，執行安裝程式，在 License Agressment 選擇開始安裝並同意版權聲明後，在 Choosing a Setup Type 的畫面選擇 Developer Default 然後 Next

![](Image/Image2.png) 

在 Check Requirements 的畫面選擇 Next

![](Image/Image3.png) 

在 Installation 的畫面選擇 Execute，就會進入開始安裝的步驟。安裝完成後，選擇 Next

![](Image/Image4.png) 

![](Image/Image5.png) 

在 Product Configuration 的畫面選擇 Next

![](Image/Image6.png) 

之後會依序跳出下列畫面，均選擇 Next

![](Image/Image7.png) 

![](Image/Image8.png) 

在 Accounts and Roles 的畫面設定資料庫管理員(root)密碼的步驟，輸入一個你自己決定的密碼，並新增一位使用者，然後選擇 Next

![](Image/Image9.png) 

![](Image/Image9-1.png) 

MySQL server 預設在電腦開機時開啟。建議就讓他自動開啟，省得麻煩，如果你取消勾選，到時候要自己到服務管理開啟 (services.msc)

![](Image/Image10.png) 

以下均選擇 Next/Execute/Finish，按照紅框指示操作

![](Image/Image11.png) 

![](Image/Image12.png) 

![](Image/Image13.png) 

![](Image/Image14.png) 

![](Image/Image15.png) 

![](Image/Image16.png) 

連接到數據庫

![](Image/Image17.png) 

![](Image/Image18.png) 

![](Image/Image19.png) 

最後是安裝應用配置。完成配置後 MySQL 就安裝完成了

![](Image/Image20.png) 

![](Image/Image21.png) 

安裝成功出現這個，其實這個安裝包括了 MYSQL 的可視化的工具 workbench 部分

MySQL Workbench 是一款專為資料庫架構師、開發人員和 DBA 打造的一個統一的視覺化工具。MySQL Workbench 提供了資料建模工具、SQL 開發工具和全面的管理工具(包括伺服器配置、使用者管理、備份等)，可在 Windows、Linux 和 Mac OS 上使用

![](Image/Image22.png)

新建一個數據庫連接

![](Image/Image23.png)

數據庫測試成功

![](Image/Image24.png)

