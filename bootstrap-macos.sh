#!/bin/sh
set -e

# MacPorts
mpVersion='2.7.2'

curl -O https://distfiles.macports.org/MacPorts/MacPorts-$mpVersion.tar.bz2
tar xf MacPorts-$mpVersion.tar.bz2
cd MacPorts-$mpVersion/
./configure
make
sudo make install
sudo port -N install \
    64tass \
    CubicSDR \
    ImageMagick \
    MoltenVK \
    VLC \
    aria2 \
    audacity \
    autoconf \
    automake \
    bochs \
    bsdmake \
    ccache \
    cmake \
    docbook-xml \
    dos2unix \
    emscripten \
    ffmpeg \
    fish \
    fldigi \
    freeglut \
    freeimage \
    generaluser-soundfont \
    git \
    glew \
    glm \
    gmake \
    gnuradio \
    go \
    gqrx \
    gr-fosphor \
    gr-osmosdr \
    inetutils \
    irssi \
    lcov \
    ledger \
    libdevil \
    libpng \
    librsvg \
    libsdl2 \
    libsdl2_image \
    libtool \
    lua \
    meson \
    mosh \
    mpstats \
    ninja \
    pandoc \
    parallel \
    perl5 \
    ruby \
    subversion \
    tmux \
    tree \
    wget \
    yt-dlp \

# LLVM and Clang tools like clang-tidy, clang-format
sudo port install clang-14
sudo port select --set clang mp-clang-14

    #include-what-you-use \

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
