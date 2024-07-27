#!/usr/bin/env bash

set -e

p1080=1920x1080
p720=1280x720
p169=1600x900

if [ $(uname -m) == 'x86_64' ] 
then
	tag=
elif [ $(uname -m) == 'aarch64' ] 
then 
	tag=:rpi
else
	echo 'not matched platform!'
	exit 0
fi

NAME=webots-lab

docker rm -f $NAME

#docker system prune -f

xhost +local:root > /dev/null 2>&1

docker run -it --name $NAME --gpus all \
	--network host \
	--privileged \
	-v /dev:/dev \
	-v /run/systemd:/run/systemd \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v webots_space:/webots_space \
	-e DISPLAY \
	wn1980/webots
