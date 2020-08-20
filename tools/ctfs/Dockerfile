FROM rbits/toolchain:latest as playbox
RUN apt-get update && \
    apt-get install -y \
    strace \
    ltrace \
    net-tools \
    procps \
    binwalk \
    libpcre3-dev \
    libdb-dev \
    libxt-dev \
    libxaw7-dev \
    libc6:i386 \
    libstdc++6:i386 \
    sudo \
    apt-utils \
    locales \
    gdb \
    default-jdk \
    nasm \
    rubygems \
    ruby-dev \
    autoconf \
    socat \
    netcat \
    nmap \
    tcpdump \
    exiftool \
    squashfs-tools \
    unzip \
    upx-ucl \
    manpages-dev \
    libtool-bin \
    bison \
    gperf \
    libseccomp-dev \
    libini-config-dev \
    libssl-dev \
    libffi-dev \
    libc6-dbg \
    libglib2.0-dev \
    libc6-dbg:i386 \
    libstdc++6:i386 \
    libc6-dev-i386


RUN pip3 install \
    unicorn \
    ropper \
    requests \
    pwn \
    scapy \
    pycipher \
    uncompyle6 \
    pwntools \
    xortool \
    r2pipe

COPY install_playtools.sh / 
RUN bash install_playtools.sh && rm /install_playtools.sh

