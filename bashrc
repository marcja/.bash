#!/bin/bash
#: Title        : .bashrc
#: Author       : "Marc Jacobs" <bash.git@marcja.com>
#: Description  : Personal environment file for interactive bash subshells. We
#                 recommend that you place your aliases, functions, and fancy 
#                 prompts here.
#: Options      : None

echo info: sourcing $BASH_HOMErc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

##-----------------------------------------------------------------------------
## exports
##-----------------------------------------------------------------------------
export BASH_HOME=$HOME/.bash
export CDPATH='.:~/:..:../..:~/.dirlinks'
export GIT_CEILING_DIRECTORIES=/home
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTIGNORE="&:la:ls:ll:pwd:exit:clear"
export HISTSIZE=10000
export LESS='-erX'
export LS_OPTIONS='--color=auto'
export PAGER=less
export PATH=$HOME/local/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '

if [[ "$OSTYPE" = "linux-gnu" ]]; then
  echo info: linux-gnu
  export EDITOR=vim
elif [[ "$OSTYPE" =~ darwin ]]; then
  echo info: darwin
  export CLICOLOR=1
  export EDITOR="mate -w"
  export LSCOLORS=dxfxcxdxbxegedabagacad
  export TERM=xterm-color
fi

# perforce
export P4CONFIG=.p4config
export P4DIFF=/home/build/public/google/tools/p4diff
export P4MERGE=/home/build/public/eng/perforce/mergep4.tcl
export P4EDITOR=$EDITOR

# google
export GOOGLE_USE_CORP_SSL_AGENT=true

##-----------------------------------------------------------------------------
## sources
##-----------------------------------------------------------------------------
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

# load all function libraries
for file in $BASH_HOME/completions/*; do source $file; done
for file in $BASH_HOME/functions/*; do source $file; done

##-----------------------------------------------------------------------------
## aliases
##-----------------------------------------------------------------------------
[ -f $BASH_HOME/aliases ] && source $BASH_HOME/aliases

##-----------------------------------------------------------------------------
## options
##-----------------------------------------------------------------------------
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s extglob
shopt -s histappend histreedit histverify
shopt -s no_empty_cmd_completion

set bell-style visible

# Tell less not to beep and also display colours
export LESS="-QR"
# Adjust the less highlight colors
export LESS_TERMCAP_so="$(printf 'rev\nbold\nsetaf 3\n' | tput -S)"
export LESS_TERMCAP_se="$(tput sgr0)"

