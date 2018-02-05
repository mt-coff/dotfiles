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

# zsh
while true; do
  echo -n "Do you use zsh? [y/n]:"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    ln -sf ~/dotfiles/zsh/zlogin ~/.zlogin
    ln -sf ~/dotfiles/zsh/zlogout ~/.zlogout
    ln -sf ~/dotfiles/zsh/zshenv ~/.zshenv
    ln -sf ~/dotfiles/zsh/zprofile ~/.zprofile
    ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
    break
  elif [ $ans = 'n' ] || [ $ans = 'no' ]; then
    echo "Skipped!"
    break
  else
    continue
  fi
done

# anyenv
while true; do
  echo -n "Do you use anyenv? [y/n]"
  read ans
  if [ -z $ans ] ; then
    continue
  elif [ $ans = 'y' ] || [ $ans = 'yes' ] ; then
    git clone https://github.com/riywo/anyenv ~/.anyenv
    git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
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

# editrc
ln -sf ~/dotfiles/commons/editrc ~/.editrc
