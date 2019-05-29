#!/bin/bash
#arm
docker pull homeassistant/raspberrypi3-homeassistant
#x86
#docker pull homeassistant/home-assistant
# docker stop hass
# docker rm hass
docker-compose up -d
docker image prune -f