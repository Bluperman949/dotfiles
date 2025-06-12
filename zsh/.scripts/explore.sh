#!/bin/bash

dest='.'

function _explore {
  [ "$1" = '.' ] && return
  if [ -d "$1" ]; then
    dest=`realpath "$1"`
    cd "$1"
    _explore $(FZF_DEFAULT_COMMAND='echo "..\n." && fd -LHd 2' fzf -i)
  else
    open.sh "$1"
  fi
}

[ $# -eq 0 ] && _explore $PWD || _explore $1
cd "$dest"
