#!/usr/bin/env bash

#TODO: see if possible to automate installation of oh-my-zsh

if [ "$(uname)" == "Darwin" ]; then
  #install brew
  if [ "$(which brew)" == "/usr/local/bin/brew" ]; then
    echo "brew installed"
  else 
    echo "brew not installed"
  fi
  #call separate script with all packages to install with brew
else
  #everything that will happen if not run a mac (later functionality
  echo "not a mac"
fi

#symlink all dotfiles to ~
