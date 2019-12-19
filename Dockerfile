FROM ubuntu:latest

# Set the the maximum size of core files created to unlimited
RUN ulimit -c unlimited

# Install development dependencies
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

# Download and install the ARM GCC toolkit for linux Version 7-2018-q2-update
ADD https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 /tmp/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
RUN mkdir -p /usr/local/share/arm
RUN tar -C /usr/local/share/arm -xjf /tmp/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
RUN (cd /usr/local/share/arm/gcc-arm-none-eabi-7-2018-q2-update/bin/ && \
    for x in *; do \
        ln -s /usr/local/share/arm/gcc-arm-none-eabi-7-2018-q2-update/bin/$x /usr/local/bin/$x; \
    done)

# Create the workspace and set it as the workdir.  This is where the local volume should be mounted
RUN mkdir -p /workspace
WORKDIR /workspace
