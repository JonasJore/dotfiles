export PATH="$PATH:$HOME/Code/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export TERM="xterm-256color" #colors
# Path to your oh-my-zsh installation.
export ZSH="/Users/jonasjore/.oh-my-zsh"
# setting the shell
export SHELL=/usr/bin/zsh
#oh-my-zsh install location
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Check for updates every n days
export UPDATE_ZSH_DAYS=7
# Displaying red dots when waiting for command completion
COMPLETION_WAITING_DOTS="true"

plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/zsh_aliases.sh
