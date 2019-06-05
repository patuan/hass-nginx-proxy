#!/bin/bash
echo "Update: Although this guide is still relevant, some people are experiencing issues with the add-apt-repository command. I've added a note in the appropriate step below for those that wish to follow the guide I've laid out, but I believe the best way moving forward is to use a much simpler method and install directly from get.docker.com. See the example below. \n\n"
curl -sSL https://get.docker.com | sh

echo "\n\n"
echo "Since Raspbian is Debian based, we will use apt to install Docker. But first, we need to update."
echo "\n"
sudo apt-get update

echo "\n\n"
echo "Install packages to allow apt to use a repository over HTTPS"
echo "\n
sudo apt-get install apt-transport-https \
                       ca-certificates \
                       software-properties-common"

echo "\n\n"
echo "Add Docker's GPG key"
echo "\n"
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

echo "\n\n"
echo "Set up the stable repository:"
echo "\n"
sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       raspbian-$(lsb_release -cs) \
       main"

echo "\n\n Install docker \n"
sudo apt-get update
sudo apt-get -y install docker-engine

