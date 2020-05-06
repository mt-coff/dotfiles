#==================================================
# autoload
#==================================================

autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -Uz vcs_info && vcs_info
autoload -Uz add-zsh-hook

#==================================================
# completion
#==================================================

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#==================================================
# colors
#==================================================

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

#==================================================
# options
#==================================================

setopt share_history
setopt histignorealldups
setopt auto_cd
setopt prompt_subst
setopt correct

#==================================================
# History
#==================================================

export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=50000

#==================================================
# Key
#==================================================

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

#==================================================
# Aliases
#==================================================

alias g='git'
alias la='ls -a'
alias ll='ls -l'
alias F=' | fzf'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

if [ uname = 'Darwin' ]; then
  alias ctags=$(brew --prefix)"/bin/ctags"
fi

#==================================================
# anyenv
#==================================================

if type anyenv > /dev/null 2>&1; then
  eval "$(anyenv init - --no-rehash)"
fi

#==================================================
# fzf
#==================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'
export FZF_DEFAULT_OPTS="--height 40% --reverse --border --preview 'head -20 {}'"

#==================================================
# functions
#==================================================

mt() {
  cd $(ghq root)/github.com/mt-coff
}

ghcd() {
  dir=$(ghq list | fzf)
  if [[ -n "$dir" ]]; then
    cd "$(ghq root)/$dir"
  fi
}

gho() {
  dir=$(ghq list | fzf)
  if [[ -n "$dir" ]]; then
    open "https://$dir"
  fi
}

#==================================================
# zplug
#==================================================

if [ ! -e $HOME"/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# Plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "b4b4r07/enhancd", use:init.sh
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

#==================================================
# compile
#==================================================

[[ ! -f ~/.zshrc.zwc || ~/.zshrc -nt ~/.zshrc.zwc ]] && zcompile ~/.zshrc
