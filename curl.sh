#!/usr/bin/env bash

cd; curl -#L https://github.com/alxlu/dotfiles/tarball/v2 | tar -xzv --strip-components 1 --exclude={brew.sh,macos.sh,linkbin.sh,bootstrap.sh,curl.sh}