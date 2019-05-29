#!/bin/bash
#arm
docker pull homeassistant/raspberrypi3-homeassistant
#x86
#docker pull homeassistant/home-assistant
docker stop ha
docker rm ha
docker-compose up -d
docker image prune -f