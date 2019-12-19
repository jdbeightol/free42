FROM ubuntu:latest
RUN ulimit -c unlimited
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    pkg-config \
    xorg \
    libx11-dev \
    libxmu-dev \
    libgtk2.0-dev \
    libasound2-dev \
    gdb \
    gdbserver
RUN mkdir -p /workspace
WORKDIR /workspace
