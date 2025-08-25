#!/bin/bash

export wins=$(
  wmctrl -lx | sed -E 's%.*archlinux%[95m [0m%'
)
export cmds=$(
  printf "[92m [0m %s\n" $(ls -r /usr/bin)
)
export apps=$(
  printf "[94m [0m %s\n" $(ls /usr/share/applications | sed 's/\.desktop//')
)

export FZF_DEFAULT_COMMAND='
echo -e "[91m  nvm[0m
$wins
$apps
$cmds"
'
export FZF_DEFAULT_OPTS='
--ansi --layout=reverse
'

pick=$(fzf)
tchar=${pick:0:2}
pick=${pick:3}

if   [[ $tchar == ' ' ]]; then $pick
elif [[ $tchar == ' ' ]]; then wmctrl -a "$pick"
elif [[ $tchar == ' ' ]]; then trap '' HUP; gtk-launch "$pick" >/dev/null 2>&1
fi
