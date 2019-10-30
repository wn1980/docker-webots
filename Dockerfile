FROM nvidia/cuda:10.0-cudnn7-devel

RUN apt-get update && apt-get install -y \
  wget

RUN wget https://www.cyberbotics.com/archive/linux/webots_2019b_amd64.deb
  
RUN dpkg -i webots_2019b_amd64.deb
RUN rm webots_2019b_amd64.deb

