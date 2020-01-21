FROM debian:10
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
       build-essential \
       autoconf \
       cmake \
       pkg-config \
       curl \
       git \
       wget \
       python-dev \
       python-pip \
       libtool \
       lcov \
       valgrind \
       dumb-init \
       bsdmainutils \
       python-requests \
    && pip install \
       virtualenv \
       pyblake2 \
       pip

