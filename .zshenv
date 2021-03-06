# Language

LANG='en_US.UTF-8'
LANGUAGE='en'

# Editors

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Less

export LESS='-F -g -i -M -R -S -w -X -z-4'

# anyenv

export ANYENV_DEFINITION_ROOT=$HOME/.anyenv

if [ -d $HOME/.anyenv ]; then
  for D in `ls $ANYENV_DEFINITION_ROOT/envs`
  do
    export PATH=$HOME/.anyenv/envs/$D/shims:$PATH
  done

fi

# Android

export ANDROID_HOME=$HOME/Library/Android/sdk

# GO

export GOPATH=$HOME/.ghq
export GO111MODULE=auto

# Rust
export CARGO_HOME=$HOME/.cargo

# Path

typeset -gU cdpath fpath mailpath path

path=(
  /usr/local/{bin,sbin}(N-/)
  $GOPATH/bin(N-/)
  $ANDROID_HOME/bin(N-/)
  $ANDROID_HOME/tools
  $ANDROID_HOME/platform-tools
  $ANYENV_DEFINITION_ROOT/bin(N-/)
  $CARGO_HOME/bin(N-/)
  $HOME/.cargo/env
  $path
)

