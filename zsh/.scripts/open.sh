#!/bin/bash

if [[ $# -ne 1 ]]; then echo "open.sh takes 1 arg! Recieved: '$@'"; exit; fi

t=`file -Lb $1`
if [[ $t =~ text  ]]; then nvim $1; exit; fi
echo "Couldn't open $1 ($t)"
# xdg-open $1
