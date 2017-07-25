#!/bin/bash
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
open -a xQuartz
xhost + "$ip" 1>/dev/null
if [ ! "$(docker ps -aq -f name=virt-manager)" ]; then
	docker create --name virt-manager \
		-e DISPLAY="$ip":0 \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		mbentley/virt-manager
fi
docker start virt-manager 1>/dev/null
