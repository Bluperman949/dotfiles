#!/bin/bash

if [[ $# -ne 1 ]]; then echo "listen.sh takes 1 arg! Recieved: '$@'"; exit; fi

if [[ -d $1 ]]; then
  echo "Cannot listen to directory $1"
else
  echo "Listening to $1"
  tail -f $1 | bat --paging=never -ppl log
fi
