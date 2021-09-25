# Install go and setup the environment

## Install go in **Linux os** and setup the environment

### Step 1: download go installation file

choose the go version that you want, and use below syntax to download file

```
wget https://dl.google.com/go/go1.17.1.linux-amd64.tar.gz
```

### Step 2: install go

install go in /usr/local/
```
sudo tar -C /usr/local -xzf go1.12.13.linux-amd64.tar.gz
```

### Step 3: setup environment variable

```
sudo vim /etc/profile

export PATH=$PATH:/usr/local/go/bin
```

### Step 4: check success install go or not
```
go version
```


## Reference

* [Go Download and install](https://golang.org/doc/install)

* [在Linux環境下安裝Go](https://dotblogs.com.tw/DizzyDizzy/2019/11/22/GoToInstall)