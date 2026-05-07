#!/usr/bin/sh

ref="$HOME/.dotfiles/zsh/scripts/gruvbox.txt"

[[ $# -ne 0 ]] && cat $ref | grep $1 || cat $ref
