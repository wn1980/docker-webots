FROM cyberbotics/webots:latest

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-numpy \
    python3-matplotlib \
    python3-sympy \
    python3-pip \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    ikpy \
    jupyterlab

ADD start_jupyter.sh /

CMD ["/bin/bash", "/start_jupyter.sh"]
