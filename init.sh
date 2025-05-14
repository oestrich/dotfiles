#!/bin/bash

# vim
if [ ! -e ~/.config/nvim ]; then
	ln -s ~/dotfiles/nvim ~/.config/nvim
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

# postgres
if [ ! -e ~/.psqlrc ]; then
	ln -s ~/dotfiles/psqlrc ~/.psqlrc
fi

# zshrc
bashgrep=$(grep "source ~/dotfiles/zshrc" ~/.zshrc)
if [ "$bashgrep" != "source ~/dotfiles/zshrc" ]; then
	echo "source ~/dotfiles/zshrc" >>~/.zshrc
fi