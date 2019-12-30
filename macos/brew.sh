# update homebrew (casks and packages)
brew update
brew upgrade

# installs all dependencies contained in ./Brewfile
echo "[brew] Installing the casks..."
brew bundle
