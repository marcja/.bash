#!/bin/bash
#: Title        : bash_profile
#: Author       : "Marc Jacobs" <bash.git@marcja.com>
#: Description  : Personal profile for bash login shells. We recommend that you
#                 make sure this sources ~/.bashrc, then ignore it.
#: Options      : None

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
