#!/usr/bin/env bash

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

NAME=webots-novnc

docker rm -f $NAME

docker system prune -f

docker run -d --name $NAME \
	--network host \
	--privileged \
	--restart unless-stopped \
	-v /dev:/dev \
	-v /run/systemd:/run/systemd \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-e VNC_PASSWORD=vnc123 \
	-e VNC_RESOLUTION=$p169 \
	wn1980/webots-novnc${tag} startup.sh
