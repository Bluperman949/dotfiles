#!/bin/bash

for i in $@; do
  if [[ -d $i ]]; then
    echo "Cannot show directory $i"
    continue
  fi

  t=`file -Lb $i`
  echo "[$t]"
  if [[ $t =~ text  ]]; then bat -fpp -r:64 $i; continue; fi
  if [[ $t =~ image ]]; then kitten icat $i; continue; fi
done
