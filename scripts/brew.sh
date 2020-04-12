#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names
brew install gnu-sed

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

brew install bash-completion@2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/fish;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
# brew install homebrew/php/php55 --with-gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Custom
brew install fish
brew install fpp
brew install jq
brew install tmux
brew install fasd

#fzf
brew reinstall --HEAD fzf
# Install shell extensions
/usr/local/Cellar/fzf/HEAD/install

# Install other useful binaries.
# brew install ack
# brew install dark-mode
#brew install exiv2
brew install git
# brew install git-lfs
brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
brew install pv
brew install rename
# brew install rhino
# brew install speedtest_cli
brew install ssh-copy-id
brew install tree
# brew install zopfli

# install node
brew install node

# install nvm
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

brew install yarn

# casks
brew cask install google-chrome
brew cask install macvim
brew cask install iterm2
brew cask install hammerspoon
brew cask install disk-inventory-x
brew cask install vlc
# brew cask install virtualbox
# brew cask install vagrant
brew cask install docker
brew install docker-completion
brew install docker-compose-completion
brew cask install atom

brew cask install dropbox

brew cask install webstorm
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install tower
brew cask install beyond-compare

# Remove outdated versions from the cellar.
brew cleanup