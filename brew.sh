#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! $(which brew)
then
  echo "Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install and setup Mongodb
brew tap mongodb/brew
brew install mongodb-community
sudo mkdir -p /data/db
sudo chown -R `id -un` /data/db

brew install gmp
brew install grep
brew install node
brew install tree
brew install yarn

# Install useful binaries.
brew install git
brew install rsync

## Apps I use
brew cask install 1password
brew cask install alfred
brew cask install homebrew/cask-versions/firefox-nightly # Nightly
brew cask install google-chrome #Chrome
brew cask install grammarly
brew cask install iterm2
brew cask install mongodb-compass
brew cask install notion
brew cask install postman
brew cask install spotify
brew cask install skype
brew cask install slack
brew cask install visual-studio-code
brew cask install moom
brew cask install vlc
brew cask install ngrok

# Remove outdated versions from the cellar.
brew cleanup
