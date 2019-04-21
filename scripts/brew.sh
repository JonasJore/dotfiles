#!/usr/bin/env bash

## installs necessary dependencies using brew

echo "installing node using Homebrew..."; echo;
brew install node &> /dev/null

echo "installing docker!"; echo;
brew install docker &> /dev/null
