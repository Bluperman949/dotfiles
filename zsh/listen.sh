#!/bin/bash

if [[ -d $1 ]]; then
  echo "Cannot listen to directory $1"
  continue
fi
echo "Listening to $1"
tail -f $1 | bat --paging=never -ppl log
