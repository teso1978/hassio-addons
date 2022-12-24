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
        g++             \
        gcc            \
        bsdutils              \
        file                  \
        openssl               \
        ca-certificates       \
        ssh                   \
        wget                  \
        patch                 \
        sudo                  \
        htop                  \
        dstat                 \
        vim                   \
        tmux                  \
        curl                  \
        git                   \
        jq                    \
        zsh                   \
        ksh                   \
        xz-utils              \
        build-essential       \
        python3-pip           \
        python3-dev           \
        python3               \
        bash-completion       && \
    apt-get clean


RUN cd /tmp
RUN wget https://github.com/guation/WiringPi-arm64/releases/download/2.61-g/wiringpi-2.61-g.deb
RUN dpkg -i wiringpi-2.61-g.deb

COPY node /usr/local/

RUN cd /app      
RUN npm install \
        --no-audit \
        --no-fund \
        --no-update-notifier \
        --omit=dev \
        --unsafe-perm 
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