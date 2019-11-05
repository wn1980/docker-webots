ARG tag
FROM wn1980/docker-webots${tag}

# prepare libraries files
#COPY setup/noVNC-1.1.0.tar.gz /opt/
#COPY setup/websockify-0.8.0.tar.gz /opt/

#install noVNC
ENV NO_VNC_HOME=/opt/noVNC
WORKDIR /opt
RUN wget https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz
RUN wget https://github.com/novnc/websockify/archive/v0.9.0.tar.gz

RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
	tar xzfv v1.1.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
	tar xzfv v0.9.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html && \
	rm -f *.tar.gz

#COPY ./setup/install/chrome.sh /opt/docker/install/
#RUN /opt/docker/install/chrome.sh

# install packages
COPY setup/install/main_pkgs.sh /opt/docker/install/
RUN /opt/docker/install/main_pkgs.sh

# clean
RUN apt-get autoclean && \
    apt-get autoremove 

# add configuation files
COPY setup/opt /opt

ENV PATH="/opt/docker/bin:${PATH}"
#RUN set_user_permission.sh /opt/docker $HOME

RUN chmod -Rf 777 /opt/docker/log/

COPY setup/ui/jwm/jwm-session /opt/docker/bin/
RUN chmod a+x /opt/docker/bin/jwm-session

#wallpapers
COPY setup/ui/wallpapers /opt/docker/wallpapers

# VNC ports
EXPOSE 5901 6901

ENV USER=root

ENV HOME=/root

ENV SHELL=/bin/bash

#ENV LIBGL_ALWAYS_SOFTWARE=true

WORKDIR $HOME

USER $USER

#jwm ui
#COPY setup/ui/jwm/jwmrc $HOME/.jwm
#RUN ln -s $HOME/.jwm/main.jwmrc $HOME/.jwmrc

ENV VIRTUALGL_VERSION 2.6.3

# install VirtualGL
RUN apt-get update && apt-get install -y --no-install-recommends \
    libglu1-mesa-dev mesa-utils curl ca-certificates xterm 
    
RUN curl -sSL https://downloads.sourceforge.net/project/virtualgl/"${VIRTUALGL_VERSION}"/virtualgl_"${VIRTUALGL_VERSION}"_amd64.deb -o virtualgl_"${VIRTUALGL_VERSION}"_amd64.deb && \
    dpkg -i virtualgl_*_amd64.deb && \
    /opt/VirtualGL/bin/vglserver_config -config +s +f -t && \
    rm virtualgl_*_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/opt/VirtualGL/bin:${PATH}"

ENV VGL_DISPLAY=:1.0

