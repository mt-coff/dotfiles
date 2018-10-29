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

export ANYENV_ROOT=$HOME/.anyenv

if [ -d $HOME/.anyenv ]; then
  for D in `ls $ANYENV_ROOT/envs`
  do
    export PATH=$HOME/.anyenv/envs/$D/shims:$PATH
  done

fi

# JAVA & Android

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_HOME=$HOME/Library/Android/sdk

# GO

export GOPATH=$HOME/.ghq

# Path

typeset -gU cdpath fpath mailpath path

path=(
  /usr/local/{bin,sbin}(N-/)
  $GOPATH/bin(N-/)
  $JAVA_HOME(N-/)
  $ANDROID_HOME/bin(N-/)
  $ANDROID_HOME/tools
  $ANDROID_HOME/platform-tools
  $ANYENV_ROOT/bin(N-/)
  $HOME/.cargo/env
  $path
)

if [ $(uname) = "SunOS" ]; then
  path=(
    /usr/local/{bin,sbin}(N-/)
    $path
  )
fi
