#!/usr/bin/env bash

echo "Updating system"
brew update
brew upgrade --greedy

echo "Installing dependencies..."
brew install fd exa bat zsh neovim wget curl git gnupg2 stow feh starship aerospace
brew tap homebrew/cask-fonts
brew install font-monaspace-nerd-font --cask

echo "Installing vim plugins..."
nvim --headless +"MasonInstallAll" +q

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s /bin/zsh
stow . -t ~ --adopt # Set simliks to all config files in the HOME

exit 0
