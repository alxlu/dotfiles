#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE}")";

cd $DIR/homedir
function sync() {
    rsync --exclude ".git/" \
            --exclude ".DS_Store" \
            -avh --no-perms . ~;
    source ~/.zshrc;
}

sync;
unset sync;