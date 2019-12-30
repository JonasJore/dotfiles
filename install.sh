#!/usr/bin/env bash

#constants
CURRENT_DIR="$(cd "$(dirname "$0")"; pwd)"
HOMEBREW_REPO="https://raw.githubusercontent.com/Homebrew/install/master/install"

echo "welcome sir!"

if [ "$(uname)" == "Darwin" ]; then
  #install Homebrew
  if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL $HOMEBREW_REPO)"
  fi;
  
  source macos/macosdefaults.sh
  echo "Updating everything..."
  source macos/updatemac.sh
else
  #everything that will happen if not run a mac (later functionality)
  echo "not a mac"
fi

echo "symlinking and finishing up"
#symlink all dotfiles to ~
ln -sv "${CURRENT_DIR}"/.zshrc ~
ln -sv "${CURRENT_DIR}"/.vimrc ~
ln -sv "${CURRENT_DIR}"/.zsh_aliases ~

echo "bye now!"