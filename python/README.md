# 安裝 python3 並設定環境


## 在 Ubuntu 系統中安裝 python3 並設定環境

在開始之前，需要一台安裝了 Ubuntu(本次範例是在 16.04 版操作) 的作業系統。如果尚未安裝 Ubuntu，可以參考 [Ubuntu系統安裝](https://github.com/machineCYC/EnvironmentSetting/tree/master/Linux)或者是[Virtualbox Ubuntu安裝](https://github.com/machineCYC/EnvironmentSetting/tree/master/Hadoop/02-UbuntuLinux)。


### Step 1: 設置 python3

Ubuntu 預裝了 python3 和 python2。為了確保版本是最新的，所以先更新和升級系統 apt-get

```
sudo apt-get update
sudo apt-get -y upgrade
```

該 -y 標誌將確認我們同意才能進行安裝的所有項目，但根據安裝的 Ubuntu 版本，可能需要確認額外的提示進行系統更新和升級。一旦過程完成，我們可以通過鍵入以下內容檢查系統中安裝的 Python3 的版本：

```
python3 -V
```

要管理 Python 套件，先安裝PIP:

```
sudo apt-get install -y python3-pip
```

另外有一些開發工具要先安裝，以確保環境的設置:

```
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
```

- [build-essential](https://packages.ubuntu.com/xenial/build-essential) 主要是為了編譯 C/C++
- [libssl-dev](https://packages.ubuntu.com/zh-tw/trusty/libssl-dev) 是 OpenSSL 通用库，主要跟傳輸資料有關
- [libffi-dev](https://packages.ubuntu.com/trusty/libffi-dev) 不同語言之間調用的編譯器
- [python-dev](https://packages.ubuntu.com/zh-tw/trusty/python-dev) 包含的則是用來以其它語言開發延伸模組用的部分


一旦 Python 設置完成，並安裝了 pip 和其他工具，我們可以為我們的開發項目設置一個虛擬環境。

### Step 2: 設置虛擬環境

虛擬環境能夠在服務器上為 Python project 提供獨立的空間，確保每個 project 都有自己的一組依賴性，不會中斷任何其他 project。設置編程環境使我們能夠更好地控制我們的 Python project 以及如何處理不同版本的包。這在使用第三方軟件包時尤其重要。您可以根據需要設置盡可能多的 Python 編程環境。每個環境基本上是一個目錄或文件夾在你的服務器上有幾個腳本，使其作為一個環境。我們需要先安裝 virtualenv。讓我們通過鍵入以下命令安裝 virtualenv:

```
sudo apt-get install python-virtualenv
```

接著準備創建環境。選擇一個資料夾設為 Python 的編程環境，或者我們可以創建一個新的資料夾 mkdir:

```
mkdir environments
```

在環境所在的資料夾中，您可以通過運行以下命令來創建環境

```
virtualenv --python=python3.6 --no-site-packages my_env 
```

virtualenv 建立一個包含 bin include lib lib64 pyvenv.cfg share 檔案的資料夾，利用下列指令來查看

```
ls my_env
```

當要在剛建立的環境下做開發時，利用下列指令啟動

```
source my_env/bin/activate
```

如果要關閉這開發環境則利用下列指令，就會回到原來的資料夾(environments)

```
deactivate
```



### Step 3: 測試虛擬環境

創建一個簡單的“Hello，World！”程式。這將確保我們的開發環境。打開一個命令行文本編輯器，如 nano，並創建一個新文件

```
nano hello.py
```

一旦文本文件在終端窗口中打開，輸入程式

```
print("Hello, World!")
```

通過 control 和 x 鍵，並在提示保存文件時，按y 。一旦你退出 nano 並返回你的shell，則運行程序：

```
python hello.py
```

最後在終端機上應該會出現 Hello, World!


## 重建環境套件

由於在開發 python project 常常會需要用大量的套件，為了之後方便快速重建當初所使用的套件及版本，藉由下列兩個檔案來維護

- requirements.txt : 紀錄 pip freeze 的結果
- requirements-to-freeze.txt : 紀錄專案所依賴的 top-level dependencies

所以在安裝任何新的套件時都需要將其記錄至 requirements-to-freeze.txt。爾後再還原環境套件時指需要執行下列指令，安裝 top-level 套件

```
pip3 install -r requirements-to-freeze.txt
```

最後利用下列指令查看並生成這個環境下所安裝的所有套件

```
pip freeze > requirements.txt
```

## Reference

* [Add PYTHONPATH](https://blog.csdn.net/u011440558/article/details/78611829)

* [virtualenv 虛擬環境](https://blog.csdn.net/White_Idiot/article/details/78240782)