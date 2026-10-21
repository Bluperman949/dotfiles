#!/usr/bin/bash

export DESKTOP_DIRS=(
  "/usr/share/applications"
  "$HOME/.local/share/applications"
  "$HOME/.wine/drive_c/users/$USER/Desktop"
)

get_wins() {
  wmctrl -lp |
    sed -E 's%\s\s+% %g' |
    cut -d' ' -f'3,5-' |
    sed 's/ /|/' |
    while IFS=$'|' read -r pid window_title; do
      proc_name=$(tr -d "\0" <"/proc/$pid/cmdline")
      [ "$window_title" != 'picker.bash' ] &&
        printf "[95m [0m %.80s [2;3m%s[0m\n" "$window_title" "${proc_name##*/}"
    done
}

get_apps() {
  grep -PHom1 '(?<=^Name=).*' ${DESKTOP_DIRS[@]/%//*.desktop} |
    while IFS=$':' read -r file_path app_name; do
      echo "[94m [0m $app_name[2;3m $file_path[0m"
    done
}

get_cmds() {
  printf "[92m [0m %s\n" $(compgen -c)
}

get_all_options() {
  echo '[91m  nvm[0m'
  get_wins
  get_apps
  get_cmds
}

pick=$(get_all_options | fzf --ansi --layout=reverse)
pick_icon=${pick::2}
pick=${pick:3}

if   [[ $pick_icon == " " ]]; then
  kitty -1 "$pick" >/dev/null 2>&1
elif [[ $pick_icon == " " ]]; then
  wmctrl -a "${pick% *}"
elif [[ $pick_icon == " " ]]; then
  i3-msg exec "gio launch '/${pick#* /}'"
fi
