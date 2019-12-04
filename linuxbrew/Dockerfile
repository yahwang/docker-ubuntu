FROM ubuntu:18.04
LABEL maintainer="yahwang"

ARG BUILD_DEPS=" \
        build-essential \
        file \
        sudo \
        locales \
        git \
        curl\
        ca-certificates \
        "

# basic update & locale setting
RUN apt-get update \
 && apt-get upgrade -yqq \
 && apt-get install -y --no-install-recommends \
        ${BUILD_DEPS} \
 && localedef -f UTF-8 -i en_US en_US.UTF-8 \
 && useradd -m -s /bin/bash ubuntu \
 && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && apt-get autoremove -yqq --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ubuntu

WORKDIR /home/ubuntu

ENV LANG=en_US.UTF-8 \
    PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" \
 && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) \
 && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> /home/ubuntu/.bash_profile \
 && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> /home/ubuntu/.profile