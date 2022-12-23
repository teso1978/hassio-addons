ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8



SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apk add --no-cache --virtual .build-dependencies \
        g++=12.2.1_git20220924-r4 \
        gcc=12.2.1_git20220924-r4 \
        libc-dev=0.7.2-r3 \
        linux-headers=5.19.5-r0 \
        make=4.3-r1 \
        py3-pip=22.3.1-r1 \
        python3-dev=3.10.9-r1 \
        python3=3.10.9-r1 \
        wget \
        git \
        wiringpi


WORKDIR /app

# Copy root filesystem
COPY rootfs /app

# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]