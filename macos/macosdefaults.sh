echo "setting the macOS defaults..."
# show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# save screenshots to desktop
defaults write com.apple.screencapture location -string “$HOME/Desktop”
# screenshots saved as .png files by default
defaults write com.apple.screencapture type -string “png”