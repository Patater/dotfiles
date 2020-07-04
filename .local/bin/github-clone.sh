#!/bin/sh

# GitHub downloader

DEST=/tank/fs/library/Code

if [ -z "$1" ]; then
    echo "waiting for the following arguments: GitHub-URL"
    exit 1
else
    url=$1
fi

url=$(echo $url | cut -d . -f 1,2)

user=$(echo $url | cut -d / -f 4)
repo=$(echo $url | cut -d / -f 5 | cut -d . -f 1)
directory=$DEST/github.com/$user

mkdir -p $directory
echo "git clone --recursive $url.git $directory/$repo"
git clone --recursive $url.git $directory/$repo
