#!/bin/sh
set -e
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $(HOME)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask-fonts
brew install \
    64tass \
    aria2 \
    autoconf \
    automake \
    bochs \
    bsdmake \
    clang-format \
    cmake \
    dos2unix \
    emscripten \
    ffmpeg \
    font-ubuntu-mono \
    freeimage \
    git \
    go \
    imagemagick \
    irssi \
    lcov \
    ledger \
    libfreeimage \
    libpng \
    libtool \
    lua \
    mactex \
    make \
    meson \
    mosh \
    ninja \
    perl \
    ruby \
    sdl2 \
    sdl2_image \
    subversion \
    telnet \
    tmux \
    tree \
    vlc \
    wget \
    youtube-dl \
    yt-dlp/taps/yt-dlp \

brew install --cask \
    firefox \
    gimp \
    hex-fiend \

# Ruby gems
gem install --user-install \
    bundler \
    jekyll

# Build the locate database
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
