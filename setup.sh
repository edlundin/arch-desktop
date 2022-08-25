#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

echo "Updating system"
brew update

echo "Installing dependencies..."
brew install fd exa bat zsh neovim wget curl git gnupg2 stow feh
brew tap homebrew/cask-fonts
brew install font-fira-code --cask

echo "Installing vim plugins..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone --quiet https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
ln -nfs "$SCRIPT_DIR"/vim/vimrc "$HOME"/.vimrc
mkdir -p "$HOME"/.config
ln -nfs "$SCRIPT_DIR"/nvim/nvim "$HOME"/.config/nvim

echo "Installing Zim..."
wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
ln -nfs "$SCRIPT_DIR"/zim/zlogin "$HOME"/.zlogin
ln -nfs "$SCRIPT_DIR"/zim/zshrc "$HOME"/.zshrc
ln -nfs "$SCRIPT_DIR"/zim/zimrc "$HOME"/.zimrc
ln -nfs "$SCRIPT_DIR"/zim/zshenv "$HOME"/.zshenv
ln -nfs "$SCRIPT_DIR"/zim/zprofile "$HOME"/.zprofile

chsh -s /bin/zsh

zsh ~/.zim/zimfw.zsh compile
zsh ~/.zim/zimfw.zsh install 

exit 0
