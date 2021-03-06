#!/usr/bin/env bash

main() {
  case "$OSTYPE" in
    darwin*)
      cd; curl -#L https://github.com/alxlu/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={i3setup.sh,debian.sh,linkbin.sh,bootstrap.sh,curl.sh}
      ;;
    linux*)
      cd; curl -#L https://github.com/alxlu/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={brew.sh,macos.sh,linkbin.sh,bootstrap.sh,curl.sh}
      ;;
  esac
}

main
