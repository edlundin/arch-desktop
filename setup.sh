#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

echo "Updating system"
paru -Syyu

echo "Installing dependencies..."
paru -S --needed gnome-keyring libsecret libgnome-keyring fd exa bat zsh vim ly terminator fman curl git ttf-fira-code evince mupdf gnupg pipewire bspwm rofi sxhkd ttf-fira-mono ttf-material-icons polybar xorg-xinit xorg-xsetroot xorg compton-tryone-git imagemagick i3lock scrot stow feh

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

echo "Install terminator configuration"
ln -nfs "$SCRIPT_DIR"/terminator "$HOME"/.config/terminator

echo "Install polybar configuration"
ln -nfs "$SCRIPT_DIR"/polybar "$HOME"/.config/polybar

echo "Install compton configuration"
ln -nfs "$SCRIPT_DIR"/compton "$HOME"/.config/compton

echo "Install gtk configuration"
ln -nfs "$SCRIPT_DIR"/gtk-3.0 "$HOME"/.config/gtk-3.0

echo "Install rofi configuration"
ln -nfs "$SCRIPT_DIR"/rofi "$HOME"/.config/rofi

echo "Installing BSPWM files..."
ln -nfs "$SCRIPT_DIR"/bspwm "$HOME"/.config/bspwm
ln -nfs "$SCRIPT_DIR"/sxhkd "$HOME"/.config/sxhkd

echo "Installing X11 scripts..."
mkdir -p "$HOME"/.local/bin
ln -nfs "$SCRIPT_DIR"/x11/wm.bspwm_lockscreen "$HOME"/.local/bin/wm.bspwm_lockscreen
ln -nfs "$SCRIPT_DIR"/x11/wm.bspwm_padding "$HOME"/.local/bin/wm.bspwm_padding
ln -nfs "$SCRIPT_DIR"/x11/wm.bspwm_screenshot "$HOME"/.local/bin/wm.bspwm_screenshot
ln -nfs "$SCRIPT_DIR"/x11/wm.start_background "$HOME"/.local/bin/wm.start_background
ln -nfs "$SCRIPT_DIR"/x11/wm.start_bspwm "$HOME"/.local/bin/wm.start_bspwm
ln -nfs "$SCRIPT_DIR"/x11/wm.start_composite "$HOME"/.local/bin/wm.start_composite
ln -nfs "$SCRIPT_DIR"/x11/wm.start_polybar "$HOME"/.local/bin/wm.start_polybar
ln -nfs "$SCRIPT_DIR"/x11/wm.start_rofi "$HOME"/.local/bin/wm.start_rofi
ln -nfs "$SCRIPT_DIR"/x11/wm.start_sxhkd "$HOME"/.local/bin/wm.start_sxhkd
ln -nfs "$SCRIPT_DIR"/x11/xinitrc "$HOME"/.xinitrc

echo "Setting the display manager to Ly..."
sudo systemctl --force enable ly.service
sudo systemctl disable getty@tty2.service
sudo cp "$SCRIPT_DIR"/ly/config.ini /etc/ly/config.ini

exit 0
