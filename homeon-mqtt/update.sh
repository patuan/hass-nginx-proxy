#!/bin/bash
#arm
docker pull patuan81/homeon-home-assistant:arm
#x86
#docker pull patuan81/homeon-home-assistant:x86
docker-compose up -d
docker image prune -f