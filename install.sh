#!/bin/bash

#setup for php
mkdir -p $HOME/GIT/
cd $HOME/GIT/
git clone https://github.com/phpactor/phpactor.git 
cd phpactor
composer install
sudo ln -sf ~/GIT/phpactor/bin/phpactor /usr/local/bin/phpactor

#setup lsp for cssls, html etc.
sudo npm i -g vscode-langservers-extracted
