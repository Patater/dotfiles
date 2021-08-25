#!/bin/sh
set -e
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $(HOME)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask-fonts
brew install \
    autoconf \
    automake \
    bsdmake \
    cmake \
    emscripten \
    font-ubuntu-mono \
    freeimage \
    git \
    go \
    irssi \
    lcov \
    libfreeimage \
    libpng \
    libtool \
    lua \
    make \
    meson \
    mosh \
    ninja \
    sdl2 \
    telnet \
    tmux \
    tree \
    vlc \
    wget \
    youtube-dl \
