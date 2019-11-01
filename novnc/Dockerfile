ARG tag
FROM wn1980/docker-webots${tag}

# prepare libraries files
COPY setup/*.tar.gz /opt/

#install noVNC
ENV NO_VNC_HOME=/opt/noVNC
WORKDIR /opt
RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
	tar xzfv noVNC-1.1.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
	tar xzfv websockify-0.8.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html && \
	rm -f noVNC-1.1.0.tar.gz websockify-0.8.0.tar.gz

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

USER $USER

ENV SHELL=/bin/bash

WORKDIR $HOME

#jwm ui
COPY setup/ui/jwm/jwmrc $HOME/.jwm
RUN ln -s $HOME/.jwm/main.jwmrc $HOME/.jwmrc
