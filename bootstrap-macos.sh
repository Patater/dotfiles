#!/bin/sh
set -e
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $(HOME)/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install \
    64tass \
    aria2 \
    autoconf \
    automake \
    bochs \
    bsdmake \
    clang-format \
    cmake \
    devil \
    docbook \
    dos2unix \
    emscripten \
    ffmpeg \
    freeglut \
    freeimage \
    git \
    glew \
    glm \
    go \
    gnuradio \
    imagemagick \
    include-what-you-use \
    irssi \
    lcov \
    ledger \
    libfreeimage \
    libpng \
    librsvg \
    libtool \
    llvm \
    lua \
    mactex \
    make \
    meson \
    molten-vk \
    mosh \
    ninja \
    pandoc \
    parallel \
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

# Add symlinks for llvm tools
ln -s "$(brew --prefix llvm)/bin/clang-tidy" $(HOME)/.local/bin/clang-tidy

brew install --cask \
    anki \
    firefox \
    gimp \
    hex-fiend \
    unnaturalscrollwheels \
    xquartz \

# Ruby gems
gem install --user-install \
    bundler \
    jekyll

# Build the locate database
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
