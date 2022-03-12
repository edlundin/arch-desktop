#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

echo "Updating system"
sudo apt update
sudo apt upgrade

echo "Installing dependencies..."
sudo apt install fd-find exa bat zsh vim wget curl git fonts-firacode gnupg2 stow feh

echo "Installing vim plugins..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone --quiet https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
ln -nfs "$SCRIPT_DIR"/vim/vimrc "$HOME"/.vimrc

echo "Installing Zim..."
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
ln -nfs "$SCRIPT_DIR"/zim/zlogin "$HOME"/.zlogin
ln -nfs "$SCRIPT_DIR"/zim/zshrc "$HOME"/.zshrc
ln -nfs "$SCRIPT_DIR"/zim/zimrc "$HOME"/.zimrc
ln -nfs "$SCRIPT_DIR"/zim/zshenv "$HOME"/.zshenv
ln -nfs "$SCRIPT_DIR"/zim/zprofile "$HOME"/.zprofile

echo "Installing WSL2 SSH Pageant..."
wget https://github.com/BlackReloaded/wsl2-ssh-pageant/releases/download/v1.4.0/wsl2-ssh-pageant.exe -O ~/.ssh/wsl2-ssh-pageant.exe
chmod +x ~/.ssh/wsl2-ssh-pageant.exe
chsh -s /bin/zsh

exit 0
