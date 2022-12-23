ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8



SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt update         &&   \
    apt upgrade -y     &&   \
    apt install -y          \
        g++ \
        gcc \
        libc-dev\
        make \
        py3-pip \
        python3-dev \
        python3 \
        git \
        wiringpi


WORKDIR /app

# Copy root filesystem
COPY rootfs /app
COPY node /usr/local/
# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]