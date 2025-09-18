#!/bin/bash


sudo apt update
sudo apt install \
    autoconf \
    automake \
    autopoint \
    bc \
    binutils \
    binutils-dev \
    build-essential \
    bison \
    flex \
    gawk \
    gettext \
    git \
    gperf \
    grep \
    gzip \
    libattr1-dev \
    libboost-all-dev \
    libcap-ng-dev \
    libcapstone-dev \
    libglib2.0-dev \
    libguestfs-tools \
    libpixman-1-dev \
    libpython3-dev \
    libslirp-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxslt1-dev \
    ninja-build \
    netcat-traditional \
    minicom \
    m4 \
    p7zip-full \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    python3-wxgtk4.0 \
    perl \
    rsync \
    sed \
    tar \
    texinfo \
    tmux \
    u-boot-tools \
    unzip \
    wget \
    xz-utils \
    xinetd \
    zlib1g-dev

locale-gen en_US.UTF-8
update-locale

git clone https://github.com/Kitware/CMake.git
cd CMake
./bootstrap --parallel=$(getconf _NPROCESSORS_ONLN) --generator=Ninja
ninja
cd ..

cd artifact/source
mkdir -p build
python3 -m venv venv --system-site-packages
source build/venv/bin/activate
pip3 install -r requirements.txt
