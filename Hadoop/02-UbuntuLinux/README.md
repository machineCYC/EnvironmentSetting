# Ubuntu 安裝

Hadoop 最主要是在 Linux 作業系統環境下執行，所以本文主要說明如何在 VirtualBox 虛擬機器上安裝 Ubuntu Linux 作業系統。

[Ubuntu 下載連結](https://www.ubuntu-tw.org/modules/tinyd0/)

點進連結會出現如下圖所示的畫面，然後選擇桌面版本，和最新的 Ubuntu LTS 版本和電腦架構，最後就按下載。

![](Image/Image1.png)

按下載之後可能會出現這個畫面，依上面說明操作即可。

![](Image/Image2.png)

下载好以後 (大概1.5GB), 會有一個文件名稱類似 ubuntu-16.04.3-desktop-amd64.iso ，這就是 Ubuntu 的桌面版安装文件。在虛擬機器我們要安裝軟體，則需要設定虛擬光碟檔案，讓虛擬機知道安裝光碟在哪，虛擬機器就可以讀取安裝光碟中的檔案。

## 設定虛擬光碟檔案

打開 VirtualBox 虛擬機器，點選 Hadoop(可能會因為命名而有不同) 虛擬機器，之後點選設定值。

![](Image/Image3.png)

點選存放裝置 -> 空 -> 點選光碟圖示 -> 選擇虛擬光碟檔案。

![](Image/Image4.png)

點選剛剛下載的 Ubuntu 檔案，設定完成後控制器IDE就會出現剛剛下載的檔案。然後按下確定。

![](Image/Image5.png)

設定完成後，點選詳細資料。

![](Image/Image6.png)

就會跳到下圖，下方存放裝置就會出現之前選取的 Ubuntu 安裝檔案。

![](Image/Image7.png)

## 安裝 Ubuntu

點選啟動按鈕。

![](Image/Image8.png)

過幾秒鐘之後會出現如下畫面，點選繁體中文，然後點選安裝 Ubuntu。

![](Image/Image9.png)

將兩個選項都打勾，然後繼續，接下來幾個步驟都根據圖中指定操作。

![](Image/Image10.png)

![](Image/Image11.png)

![](Image/Image12.png)

![](Image/Image13.png)

![](Image/Image14.png)

依據喜好設定名稱和密碼，然後點擊繼續，就開始安裝瞜～

![](Image/Image15.png)

安裝完後，點選立即重新啟動。

![](Image/Image16.png)

重新啟動後，稍等幾分鐘會出現如下圖，然後輸入自己設定的密碼。安裝完成~~~

![](Image/Image17.png)

## 安裝 Guest Additions

Ubuntu 安裝完成，只是還存在一些小問題:

- 螢幕解析度不足
- 滑鼠游標停頓延遲
- 無法與原安裝系統共用剪貼簿
- 因此利用 Guest Additions能解決如上問題

![](Image/Image18.png)

![](Image/Image19.png)

![](Image/Image20.png)

似乎安裝失敗，參考如下[網址](https://blog.csdn.net/JCRunner/article/details/44393787)解決。

![](Image/Image21.png)

