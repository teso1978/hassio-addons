ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG C.UTF-8


# Copy root filesystem
COPY rootfs /app


# Set workdir
WORKDIR /app

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
        g++ \
        gcc \
        libc-dev \
        linux-headers \
        make=4.3-r1 \
        py3-pip=22.3.1-r1 \
        python3-dev=3.10.9-r1 \
        python3=3.10.9-r1 
RUN apk add --no-cache \
        git=2.38.2-r0 \
        icu-data-full=72.1-r1 \
#        nodejs=16.19.0 \
        npm=9.1.2-r0 \
        openssh-client=9.1_p1-r1 \
        patch=2.7.6-r8 \
        wiringpi 

COPY node /usr/local/

      
RUN npm install \
        --no-audit \
        --no-fund \
        --no-update-notifier \
        --omit=dev \
        --unsafe-perm \
    \
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