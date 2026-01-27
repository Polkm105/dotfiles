# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/loric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

typeset -U path PATH
path=(~/.local/bin $path)
export PATH

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec Hyprland &
fi

zstyle ':completion:*' menu select
export KEYTIMEOUT=5
autoload -Uz promptinit
promptinit

SHELL=/usr/bin/zsh
PROMPT="[%F{green}%n%f@%F{cyan}%m%f %~] "

zstyle ':completion:*' rehash true

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
