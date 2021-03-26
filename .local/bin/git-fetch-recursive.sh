#!/bin/sh
find . -name .git -type d -execdir pwd ';' -execdir git fetch --all -v ';'
