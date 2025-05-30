#!/bin/bash

for dir in $(ls | grep --invert-match -F '.'); do
  cd $dir
  if [[ $(ls -A) == $dir ]]; then
    mv $dir/* $dir/.* .
    rmdir $dir
  fi
  cd ..
done
