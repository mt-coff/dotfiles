#!/bin/bash

if [ -n $DOTROOT ]; then
  if [ $(uname) = 'Darwin' ]; then
    if !(type brew > /dev/null 2>&1); then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew bundle $DOTROOT/Brewfile
    fi
  fi
fi


if [ ! -d ~/.anyenv ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
fi

if [ ! -d ~/.tmux ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
