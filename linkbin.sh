#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p ~/bin
ln -vs $DIR/bin/* "$HOME/bin"

