FROM nvidia/cuda:10.0-cudnn7-devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  wget

RUN wget https://www.cyberbotics.com/archive/linux/webots_2019b_amd64.deb

RUN apt-get update && apt-get install -y \
  libatk1.0-0 \
  ffmpeg \
  libdbus-1-3 \
  libfreeimage3 \
  libglib2.0-0 \
  libglu1-mesa \
  libgtk-3-0 \
  libjpeg8-dev \
  libnss3 \
  libpci3 \
  libxaw7 \
  libxrandr2 \
  libxrender1 \
  libzzip-0-13 \
  libssh-dev \
  libzip-dev \
  xserver-xorg-core \
  libxslt1.1 \
  libgd3 \
  libfreetype6 \
  xvfb
  
RUN dpkg -i webots_2019b_amd64.deb
RUN rm webots_2019b_amd64.deb

