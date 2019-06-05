#!/bin/bash
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo gpasswd -a $USER docker

#docker-compose
docker run \    -v /var/run/docker.sock:/var/run/docker.sock \    -v "$PWD:/rootfs/$PWD" \    -w="/rootfs/$PWD" \    docker/compose:1.13.0 up
echo alias docker-compose="'"'docker run \    -v /var/run/docker.sock:/var/run/docker.sock \    -v "$PWD:/rootfs/$PWD" \    -w="/rootfs/$PWD" \    docker/compose:1.13.0'"'" >> ~/.bashrc
source ~/.bashrc