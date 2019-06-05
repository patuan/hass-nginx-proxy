#!/bin/bash
#method1
# sudo apt-get update
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $USER
# sudo apt-get install docker-ce=18.06.2~ce~3-0~raspbian
# rm get-docker.sh
# exit

#method2
# Install some required packages first
sudo apt update
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Get the Docker signing key for packages
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

# Add the Docker official repos
echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Install Docker
sudo apt update
sudo apt install docker-ce=18.06.2~ce~3-0~raspbian
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
