#!/bin/bash

# Update apt repository
echo Update apt repository
sudo apt-get update -y

# Install Docker
echo Install Docker
sudo apt-get install -y ca-certificates  curl  gnupg  lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Install kind
echo Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind --version

# Install kubectl
echo Install kubectl
sudo apt-get install -y apt-transport-https
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl version --short

# Create kind cluster
echo Create kind cluster
sudo kind create cluster
sudo kubectl get nodes
sudo kubectl get pods

# Install helm
echo Install helm
wget https://get.helm.sh/helm-v3.10.3-linux-amd64.tar.gz
tar zxvf helm-v3.10.3-linux-amd64.tar.gz
cd linux-amd64/
sudo cp helm /usr/bin
helm version
