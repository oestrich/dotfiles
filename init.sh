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

# git
if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

# gemrc
if [ ! -e ~/.gemrc ]; then
  ln -s ~/dotfiles/gemrc ~/.gemrc
fi

# ackrc
if [ ! -e ~/.ackrc ]; then
  ln -s ~/dotfiles/ackrc ~/.ackrc
fi

# bashrc
bashgrep=$(grep "source ~/dotfiles/bashrc" ~/.bashrc)
if [ "$bashgrep" != "source ~/dotfiles/bashrc" ]; then
  echo "source ~/dotfiles/bashrc" >> ~/.bashrc
fi

# Submodules
git submodule init
git submodule update

if [ ! -e ~/dotfiles/vim/bundle/command-t/ruby/command-t/ext.so ]; then
  if [ -e ~/.rvm/bin/rvm ]; then
    rubyv=`type -P ruby`
    if [ $rubyv != '/usr/bin/ruby' ]; then
      echo
      echo !!!!!!!!!!!!!!!!!!!!!!!!!!!
      echo
      echo rvm is installed, set ruby to system and rerun script!
      echo
      echo !!!!!!!!!!!!!!!!!!!!!!!!!!!
      echo
      exit
    fi
  fi

  cd ~/dotfiles/vim/bundle/command-t/
  rake make
fi
