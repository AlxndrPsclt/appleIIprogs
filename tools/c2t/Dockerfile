# Use the latest version of Ubuntu as a parent image
FROM ubuntu:latest

# Set the maintainer label
#LABEL maintainer="your-email@example.com"

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=non-interactive

# Run package updates and install packages
RUN apt-get -qy update \
    && apt-get -qy install build-essential git curl bsdmainutils unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

# Download, extract, build and install cc65
RUN curl -LO https://github.com/mrdudz/cc65-old/raw/master/cc65-sources-2.13.3.tar.bz2 \
    && tar xvf cc65-sources-2.13.3.tar.bz2 \
    && cd cc65-2.13.3/ \
    && sed -i 's!/usr/local!/root/cc65-2.13.3.bin!' make/gcc.mak \
    && mkdir -p /root/cc65-2.13.3.bin \
    && make -f make/gcc.mak \
    && make -f make/gcc.mak install \
    && cd .. \
    && rm -rf cc65-2.13.3 cc65-sources-2.13.3.tar.bz2

# Update PATH
ENV PATH="/root/cc65-2.13.3.bin/bin:${PATH}"

# Clone and build c2t
RUN git clone https://github.com/datajerk/c2t
COPY ./correctionForLinux.diff /c2t/

RUN cd c2t \
    && git apply correctionForLinux.diff

RUN cd c2t \
    && make clean

RUN cd c2t \
    && make

# Show information about built binaries
RUN ls -l /c2t/bin
