ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Copy root filesystem
COPY rootfs /app


# Set workdir
WORKDIR /app

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN apt update         && \
    apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  && \
    apt install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"     \
        g++                   \
        gcc                   \
        libc6                 \
        wget                  \
        jq                    \
        sudo                  \
        htop                  \
        git                   \
        build-essential       \
        python3-pkg-resources \
        python3               \
        #npm                   \
        #nodejs                \
        make                  \
        #wiringpi              \
        bash-completion       && \
    apt-get clean

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
# RUN export NVM_DIR="$HOME/.nvm"
# RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# RUN [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# RUN nvm install 16
# RUN npm install -g forever
# RUN cp -R $NVM_DIR/versions/node/$(nvm version)/* /usr/local/
RUN cd /tmp
RUN wget https://github.com/WiringPi/WiringPi/releases/download/2.61-1/wiringpi-2.61-1-arm64.deb
RUN dpkg -i wiringpi-2.61-1-arm64.deb

#COPY node /usr/local/

RUN cd /app      
# RUN npm install \
#         --no-audit \
#         --no-fund \
#         --no-update-notifier \
#         --omit=dev \
#         --unsafe-perm 
    #\
    # && npm cache clear --force \
    # \
    # && apk del --no-cache --purge .build-dependencies \
    # && rm -fr \
    #     /root/.cache \
    #     #/root/.npm \
    #     /root/.nrpmrc \
    #     /tmp/*
  


COPY public /app/public

# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]