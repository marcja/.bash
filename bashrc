#!/bin/bash
#: Title        : bashrc
#: Author       : "Marc Jacobs" <bash.git@marcja.com>
#: Description  : Personal environment file for interactive bash subshells. We
#                 recommend that you place your aliases, functions, and fancy 
#                 prompts here.
#: Options      : None

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

##-----------------------------------------------------------------------------
## exports
##-----------------------------------------------------------------------------
export BASH_HOME=$HOME/.bash
export CDPATH='.:~/:..:../..:~/.dirlinks'
export EDITOR=vim
export GPG_TTY=$(tty)
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTIGNORE='&:la:ls:ll:lla:pwd:exit:clear:history:h:hh:hhh'
export HISTSIZE=10000
export HISTTIMEFORMAT="[%m-%d|%H:%M] "
export LESS='-erX'
export LS_OPTIONS='--color=auto'
export PAGER=less
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/opt/bin:$PATH
export PS1="\[\033[38;05;243m\][\$(if [ \$? -eq 0 ]; then echo '\!'; else echo -en '\[\033[38;05;9m\]\!\[\033[38;05;243m\]'; fi)|\D{%m-%d|%H:%M}] \w \[\033[38;05;192m\]\$(__git_ps1 '(%s)')\n\[\033[0m\]\u@\h\$ "

# git
export GIT_CEILING_DIRECTORIES=$HOME
#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWSTASHSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWUPSTREAM=auto

# wd
export WDHOME=$HOME/.wd

if [[ "$OSTYPE" = "linux-gnu" ]]; then
  [[ "${TERM}" == "xterm" ]] && export TERM=xterm-256color
elif [[ "$OSTYPE" =~ darwin ]]; then
  export CLICOLOR=1
  export LSCOLORS=dxfxcxdxbxegedabagacad
  export TERM=xterm-color
fi

##-----------------------------------------------------------------------------
## sources
##-----------------------------------------------------------------------------
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Load work-related
[ -f $BASH_HOME/bashrc.goog ] && source $BASH_HOME/bashrc.goog

if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

# load all completion libraries
for file in $BASH_HOME/completions/*; do
  # only load the completion for 'foo' if the executable is on the path
  type -p ${file##*/} &> /dev/null && source $file; 
done

# load all function libraries
for file in $BASH_HOME/functions/*; do 
  source $file; 
done

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

function title {
  echo -en "\033]2;$@\007"
}

