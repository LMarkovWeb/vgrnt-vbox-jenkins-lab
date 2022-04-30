#!/bin/bash

# see: https://webme.ie/how-to-run-minikube-on-a-virtualbox-vm/

echo "------------ [TASK 1] Update ----------------------"
apt update && apt dist-upgrade -y

echo "------------ [TASK 1] Install Docker --------------"
apt install docker.io -y
systemctl enable docker
docker version

echo "------------ [TASK 2] Install minikube --------------"

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.7.2-0_amd64.deb \
&& dpkg -i minikube_1.7.2-0_amd64.deb

minikube config set vm-driver none

minikube start


echo "------------ [TASK 3] Install kubectl  --------------"

apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubectl