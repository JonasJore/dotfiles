#!/usr/bin/env bash

#variables:
CURRENT_DIR="$(cd "$(dirname "$0")"; pwd)"
HOMEBREW_REPO="https://raw.githubusercontent.com/Homebrew/install/master/install"

if [ "$(uname)" == "Darwin" ]; then
  #install Homebrew
  if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL $HOMEBREW_REPO)"
  fi;

  #installs all dependencies contained in ./Brewfile
  brew update && brew bundle

else
  #everything that will happen if not run a mac (later functionality
  echo "not a mac"
fi

#symlink all dotfiles to ~
ln -sv "${CURRENT_DIR}"/.zshrc ~
ln -sv "${CURRENT_DIR}"/.vimrc ~

