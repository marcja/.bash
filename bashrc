#!/bin/bash
#: Title        : .bashrc
#: Author       : "Marc Jacobs" <bash.git@marcja.com>
#: Description  : Personal environment file for interactive bash subshells. We
#                 recommend that you place your aliases, functions, and fancy 
#                 prompts here.
#: Options      : None

echo info: sourcing $HOME/.bash/bashrc

##-----------------------------------------------------------------------------
## exports
##-----------------------------------------------------------------------------
export CDPATH='.:~/:..:../..:~/.dirlinks'
export CLICOLOR=1
export EDITOR="mate -w"
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTIGNORE="&:la:ls:ll:pwd:exit:clear"
export HISTSIZE=10000
export LSCOLORS=dxfxcxdxbxegedabagacad
export LS_OPTIONS='--color=auto'
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
export PAGER=less
export PATH=$HOME/local/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '

#export LESSOPEN="| /path/to/src-hilite-lesspipe.sh %s"
#export LESS=' -R '

##-----------------------------------------------------------------------------
## sources
##-----------------------------------------------------------------------------
source /usr/local/etc/bash_completion

# load all function libraries
for file in $HOME/.bash/functions/*; do source $file; done

##-----------------------------------------------------------------------------
## aliases
##-----------------------------------------------------------------------------
[ -f $HOME/.bash/aliases ] && source $HOME/.bash/aliases

##-----------------------------------------------------------------------------
## options
##-----------------------------------------------------------------------------
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob

set bell-style visible

# Tell less not to beep and also display colours
export LESS="-QR"
# Adjust the less highlight colors
export LESS_TERMCAP_so="$(printf 'rev\nbold\nsetaf 3\n' | tput -S)"
export LESS_TERMCAP_se="$(tput sgr0)"

#if [[ "$OSTYPE" =~ darwin ]]; then
#  echo info: running on darwin
#fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
