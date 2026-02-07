#!/bin/bash

export wins=$(
  wmctrl -lx | sed -E 's%.*\w+ %[95m [0m %'
)

export cmds=$(
  printf "[92m [0m %s\n" $(ls -r /usr/bin)
)

deskNames=$(grep '^Name=' /usr/share/applications/*.desktop -hm1 | while read inp; do echo "${inp:5}"; done)
deskFiles=$(ls /usr/share/applications/*.desktop | while read inp; do echo "${inp:24:-8}"; done)
export apps=$(
  paste -d"|" <(echo "$deskNames") <(echo "$deskFiles") |
    while IFS=$'|' read -r appname filename; do
      echo "[94m [0m $appname ($filename)"
    done
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
elif [[ $tchar == ' ' ]]; then
  pick=$(echo $pick | grep -oE '\(.+\)')
  pick=${pick:1:-1}
  sh -c "( trap '' HUP; gtk-launch $pick >/dev/null 2>&1 ) &"
fi
