#!/bin/bash

export windows=$(
  wmctrl -lx |
  sed -E 's%0x.{8}  [01] \w+\.(\w+)\s+archlinux%[94m [0m%'
)
export programs=$(
  ls -r /usr/bin |
  sed 's/^/[92m  [0m/'
)

export FZF_DEFAULT_COMMAND='echo -e "[91m  nvm[0m\n$windows\n$programs"'
export FZF_DEFAULT_OPTS='
--ansi --layout=reverse
'

pick=$(fzf)
tchar=${pick:0:2}

if   [[ $tchar == ' ' ]]; then action="${pick:3}"
elif [[ $tchar == ' ' ]]; then action="wmctrl -a ${pick:3}"; fi

$action
