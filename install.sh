#!/usr/bin/env bash

#TODO: see if possible to automate installation of oh-my-zsh

#variables:
CURRENT_DIR="$(cd "$(dirname "$0")"; pwd)"
HOMEBREW_REPO="https://raw.githubusercontent.com/Homebrew/install/master/install"
PACKAGES=(
  wget
  node
  git
  git-crypt
  npm
  python3
  go
  postgresql
  docker
  heroku
)

CASKS=(
  iterm2
  firefox
  dropbox
  google-drive
  libreoffice
  slack
  vlc
  visual-studio-code
  intellij-idea
  spotify
  alfred
)

FONTS=(
  font-inconsolidata
  font-roboto
  font-clear-sans
)

if [ "$(uname)" == "Darwin" ]; then
  #install brew
  if [ "$(which brew)" == "/usr/local/bin/brew" ]; then
    echo "brew installed"
  else 
    echo "install Homebrew? [Y/n]"
    read HOMEBREW_INSTALLED
    if [ $HOMEBREW_INSTALLED == "Y" ]; then
      echo "installing Homebrew..."
      ruby -e "$(curl -fsSL $HOMEBREW_REPO)"
    fi
  fi
  #updates homebrew recipes
  brew update

  brew tap caskroom/cask
  brew tap caskroom/versions
  
  #installs all needed brew packages
  echo "installing packages..."
  brew install ${PACKAGES[@]}

  echo "installing cask apps..."
  brew install caskroom/cask/brew-cask
  brew cask install ${CASKS[@]}

  echo "installing fonts..."
  brew cask install ${FONTS[@]}

  echo "cleaning up..."
  brew cleanup --force

  echo "configuring macOS..."  
  #fast key repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 0

else
  #everything that will happen if not run a mac (later functionality
  echo "not a mac"
fi

#installs npm globally
npm install -g npm

#symlink all dotfiles to ~
ln -sv "${CURRENT_DIR}"/.zshrc ~
ln -sv "${CURRENT_DIR}"/.vimrc ~

