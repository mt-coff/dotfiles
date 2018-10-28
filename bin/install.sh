if [ -n $DOTROOT ]; then
  if [ $(uname) = 'Darwin' ]; then
    brew bundle
  fi
fi


if [[ ! -d ~/.anyenv ]]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
fi
