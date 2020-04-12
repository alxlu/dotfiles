#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE}")";

cd $DIR
function sync() {
    rsync --exclude ".git/" \
            --exclude ".DS_Store" \
            --exclude "bootstrap.sh" \
            --exclude "provision.sh" \
            --exclude "macos.sh" \
            --exclude "linkbin.sh" \
            --exclude "brew.sh" \
            -avh --no-perms . ~;
}

sync;
unset sync;