#!/bin/bash

# vim
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc

# tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

git submodule init
git submodule update
