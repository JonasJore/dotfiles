export PATH="$PATH:$HOME/Code/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export TERM="xterm-256color" #colors
# Path to your oh-my-zsh installation.
export ZSH="/Users/jonasjore/.oh-my-zsh"
# setting the shell
export SHELL=/usr/bin/zsh
#oh-my-zsh install location
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

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
