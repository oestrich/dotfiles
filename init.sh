#!/bin/bash

# vim
if [ ! -e ~/.vim ]; then
	ln -s ~/dotfiles/vim ~/.vim
fi
if [ ! -e ~/.vimrc ]; then
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi
if [ ! -e ~/.gvimrc ]; then
	ln -s ~/dotfiles/gvimrc ~/.gvimrc
fi

if [ ! -e ~/.config/nvim ]; then
	ln -s ~/dotfiles/nvim ~/.config/nvim/
fi

# git
if [ ! -e ~/.gitconfig ]; then
	ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi
if [ ! -e ~/.gitignore_global ]; then
	ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

# gemrc
if [ ! -e ~/.gemrc ]; then
	ln -s ~/dotfiles/gemrc ~/.gemrc
fi
if [ ! -e ~/.irbrc ]; then
	ln -s ~/dotfiles/irbrc ~/.irbrc
fi
if [ ! -e ~/.pryrc ]; then
	ln -s ~/dotfiles/pryrc ~/.pryrc
fi

# ackrc
if [ ! -e ~/.ackrc ]; then
	ln -s ~/dotfiles/ackrc ~/.ackrc
fi

# slate
if [ ! -e ~/.slate ]; then
	ln -s ~/dotfiles/slate ~/.slate
fi

# postgres
if [ ! -e ~/.psqlrc ]; then
	ln -s ~/dotfiles/psqlrc ~/.psqlrc
fi

# bashrc
bashgrep=$(grep "source ~/dotfiles/bashrc" ~/.bashrc)
if [ "$bashgrep" != "source ~/dotfiles/bashrc" ]; then
	echo "source ~/dotfiles/bashrc" >>~/.bashrc
fi

# Submodules
git submodule init
git submodule update
