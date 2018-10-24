#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -sf $SCRIPT_DIR/vim/vimrc ~/.vimrc
ln -snf $SCRIPT_DIR/vim ~/.vim
ln -sf $SCRIPT_DIR/tmux/tmux.conf ~/.tmux.conf
ln -snf $SCRIPT_DIR/nvim ~/.config/nvim
ln -sf $SCRIPT_DIR/zsh/zlogin ~/.zlogin
ln -sf $SCRIPT_DIR/zsh/zlogout ~/.zlogout
ln -sf $SCRIPT_DIR/zsh/zshenv ~/.zshenv
ln -sf $SCRIPT_DIR/zsh/zprofile ~/.zprofile
ln -sf $SCRIPT_DIR/zsh/zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/commons/gitignore_global ~/.gitignore_global
ln -sf $SCRIPT_DIR/commons/editrc ~/.editrc

git config --global core.excludesfile ~/.gitignore_global

if [[ ! -d ~/.anyenv ]]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
fi

echo "Initialization has ended."
