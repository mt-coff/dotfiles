#!/bin/bash

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


while true; do
  echo -n "Do you use fish? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    ln -snf ~/dotfiles/fish ~/.config/fish
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done
