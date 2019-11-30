FROM ubuntu:18.04

ARG PYTHON_VERSION=3.7.5

# locale setting
RUN apt-get update && \
    apt-get upgrade -yqq && \
    apt-get install -y locales && \
    localedef -f UTF-8 -i en_US en_US.UTF-8

ENV LANG en_US.UTF-8

ENV PYENV_ROOT="/.pyenv" \
    PATH="/.pyenv/bin:/.pyenv/shims:$PATH"

# install python requirements and pyenv
RUN apt-get install -y --no-install-recommends \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev \
    git \
    ca-certificates \
    curl && \
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# pyenv setting
RUN pyenv install ${PYTHON_VERSION} && \
    pyenv global ${PYTHON_VERSION} && \
    pip install --upgrade pip


