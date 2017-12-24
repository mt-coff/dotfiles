# env
set -x EDITOR nvim
set -x GOPATH $HOME/dev/go
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x ANDROID_HOME $HOME/Library/Android/sdk

# path
set -x PATH $GOPATH/bin $PATH
set -x PATH $JAVA_HOME $PATH
set -x PATH $ANDROID_HOME $PATH
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH
set -x PATH (yarn global bin) $PATH
