#!/bin/bash

# vim
while true; do
  echo -n "Do you use vim? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
    ln -snf ~/dotfiles/vim ~/.vim
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done

# tmux
while true; do
  echo -n "Do you use tmux? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done

# neovim
while true; do
  echo -n "Do you use neovim? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    ln -snf ~/dotfiles/nvim ~/.config/nvim
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done

# tern.js
while true; do
  echo -n "Do you use tern.js? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    ln -sf ~/dotfiles/commons/tern-config ~/.tern-config
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done

# fish
while true; do
  echo -n "Do you use fish? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    ln -snf ~/dotfiles/fish ~/.config/fish
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done

# global gitignore
ln -sf ~/dotfiles/commons/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global