FROM nvidia/cuda:9.0-cudnn7-devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  wget

RUN wget https://github.com/cyberbotics/webots/releases/download/R2019b-rev1/webots_2019b-rev1_amd64.deb

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
  qt5-default
  
RUN dpkg -i webots_2019b-rev1_amd64.deb
RUN rm webots_2019b-rev1_amd64.deb

#RUN apt-get update && apt-get install -y \
#  libxcb-xkb1 \
#  libxcb-icccm4 \
#  libxcb-image0 \
#  libxcb-render-util0 

#ENV QT_DEBUG_PLUGINS=1

#RUN ln -sf /usr/lib/x86_64-linux-gnu/qt5/plugins/platforms/ /usr/bin/

ENV QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins/platforms/

