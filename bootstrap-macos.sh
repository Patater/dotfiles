#!/bin/sh
set -e
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $(HOME)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask-fonts
brew install \
    autoconf \
    automake \
    bochs \
    bsdmake \
    clang-format \
    cmake \
    emscripten \
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
    make \
    meson \
    mosh \
    ninja \
    perl \
    ruby \
    sdl2 \
    subversion \
    telnet \
    tmux \
    tree \
    vlc \
    wget \
    youtube-dl \

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
