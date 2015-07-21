#!/bin/bash

FILES=" ackrc
aliases
ctags
colors
gitconfig
gitignore_global
gvimrc
gvimrc.after
inputrc
janus
tmux.conf
vim
vimrc
vimrc.after
vimrc.before
Xresources
zlogin
zlogout
zprezto
zpreztorc
zprofile
zshenv
zshrc"
for f in $FILES
do
  echo "Is ~/.$f exists"
  if [[ -L ~/.$f ]]
  then
    read -p "Conflict detected for ~/.$f, replace (y/n)?"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo "Removing ~/.$f"
      rm ~/.$f
      echo "Symlinking $f -> ~/dotfiles/$f"
      ln -s ~/dotfiles/$f ~/.$f
    fi
  else
    echo "Symlinking $f..."
    ln -s ~/dotfiles/$f ~/.$f
  fi
done
