
## Install Minikube prerequisites

- systemctl
- conntrack

Use the below syntax to install systemctl
```
git clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git
cd ubuntu-wsl2-systemd-script/
bash ubuntu-wsl2-systemd-script.sh
```

Use the below syntax to install conntrack
```
sudo apt install -y conntrack
```

## Install Minikube

```
# Download the latest Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Make it executable
chmod +x ./minikube

# Move it to your user's executable PATH
sudo mv ./minikube /usr/local/bin/

#Set the driver version to Docker
minikube config set driver docker
```

## Install Kubectl and set context to Minikube

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/

# set the context to Minikube
kubectl config use-context minikube
```

## Reference

- [Install Minikube in WSL 2 with Kubectl and Helm](https://www.virtualizationhowto.com/2021/11/install-minikube-in-wsl-2-with-kubectl-and-helm/)