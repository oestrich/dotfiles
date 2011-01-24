#!/bin/bash

# vim
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc

# git
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# gemrc
ln -s ~/dotfiles/gemrc ~/.gemrc

echo "source ~/dotfiles/bashrc" >> ~/.bashrc

git submodule init
git submodule update

cd ~/dotfiles/vim/bundle/command-t/
rake make
