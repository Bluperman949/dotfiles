#!/bin/bash

for i in $@; do
  echo -n "$i "
  if [[ -d $i ]]; then echo '(Directory)'; tree -CaL 1 $i; continue; fi
  t=`file -Lb $i`; echo "($t)"
  if [[ $t =~ text  ]]; then bat -fpp -r:64 $i; continue; fi
  if [[ $t =~ image ]]; then kitten icat $i; continue; fi
  echo "<Can't show this file>"
done
