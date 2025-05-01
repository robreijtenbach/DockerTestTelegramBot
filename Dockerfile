FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    build-essential \
    zlib1g-dev 

RUN wget https://www.python.org/ftp/python/3.13.1/Python-3.13.1.tgz \
    && tar -xf Python-3.13.1.tgz \
    && cd Python-3.13.1 \
    && ./configure --enable-optimizations \
    && make \ 
    && make install \
    && ln -sf /usr/local/bin/python3.13 /usr/bin/python3 \
    && ln -sf /usr/local/bin/python3.13 /usr/bin/python \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* Python-3.13.1 Python-3.13.1.tgz

ENV DISPLAY=:99

