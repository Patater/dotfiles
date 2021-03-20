#!/bin/sh
set -e
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $(HOME)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install \
    autoconf \
    automake \
    cmake \
    freeimage \
    git \
    go \
    libfreeimage \
    libpng \
    libtool \
    lua \
    mosh \
    ninja \
    sdl2 \
    tmux \
    youtube-dl \
