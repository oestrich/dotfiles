#!/bin/bash

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc

git submodule init
git submodule update
