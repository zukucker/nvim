#!/bin/bash

echo "Upgrading System..."
sudo apt update
sudo apt upgrade -y
echo "Installing git..."
sudo apt install git
echo "Cloning nvim..."
mkdir -p $HOME/GIT
git clone https://github.com/neovim/neovim $HOME/GIT/
cd $HOME/GIT/neovim
echo "Install vim..."
make
sudo make install
echo "Finished installation..."
echo "Cloniing plugin manager..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Cloning dotfiles"
rm -rf $HOME/.config/nvim
git clone https://github.com/zukucker/nvim $HOME/.config/nvim
echo "Installing dotfiles"
bash $HOME/.config/nvim/install.sh
