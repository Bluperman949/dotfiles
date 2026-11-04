#!/usr/bin/sh

IMPORTANT_PACKAGES=(
  'discord'
  'neovim'
)
URGENT_PKG_COUNT=200

pkg_names="$(pacman -Qu)"
pkg_count=$(echo "$pkg_names" | wc -l)

[ $pkg_count -le $1 ] && exit

last_upgrade="$(tail -n 1 <(grep -E 'pacman -Sy?u' /var/log/pacman.log) | cut -c 2-11)"
[ -z $last_upgrade ] && last_upgrade='never'

msg="You have <b>$pkg_count</b> packages out of date.
Last upgrade: <b>$last_upgrade</b>"
[ $pkg_count -gt $URGENT_PKG_COUNT ] && urg=2 || urg=1 \

action=$(dunstify "Package Reminder" "$msg" \
  -u $urg \
  -A 'upgrade,Upgrade' \
  -a 'package-reminder' -i 'none')

[ "$action" = upgrade ] &&
  kitty -1 --class=runner action_upgrade
