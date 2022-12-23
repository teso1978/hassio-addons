ARG BUILD_FROM
FROM $BUILD_FROM

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
        g++=12.2.1_git20220924-r4 \
        gcc=12.2.1_git20220924-r4 \
        libc-dev=0.7.2-r3 \
        linux-headers=5.19.5-r0 \
        make=4.3-r1 
    #     py3-pip=22.3.1-r1 \
    #     python3-dev=3.10.9-r1 \
    #     python3=3.10.9-r1 \
    # \
    # && apk add --no-cache \
    #     git=2.38.2-r0 \
    #     icu-data-full=72.1-r1 \
    #     nodejs=18.12.1-r0 \
    #     npm=9.1.2-r0 \
    #     openssh-client=9.1_p1-r1 \
    #     patch=2.7.6-r8 \
    #     wiringpi    \
    # \
    # && npm install \
    #     --no-audit \
    #     --no-fund \
    #     --no-update-notifier \
    #     --omit=dev \
    #     --unsafe-perm \
    # \
    # && npm cache clear --force \
    # \
    # && apk del --no-cache --purge .build-dependencies \
    # && rm -fr \
    #     /root/.cache \
    #     /root/.npm \
    #     /root/.nrpmrc \
    #     /tmp/*

# COPY node /usr/local/


# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]