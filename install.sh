#!/bin/bash

#nvim installation
#sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
#git clone https://github.com/neovim/neovim/ $HOME/GIT/
#cd $HOME/GIT/neovim/
#make
#sudo make install



#language setup
#setup for php
mkdir -p $HOME/GIT/
cd $HOME/GIT/
git clone https://github.com/phpactor/phpactor.git 
cd phpactor
composer install
sudo ln -sf ~/GIT/phpactor/bin/phpactor /usr/local/bin/phpactor

#setup lsp for cssls, html etc.
sudo npm i -g vscode-langservers-extracted pyright
