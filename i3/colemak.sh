#
#  colemak.sh
#  toggle colemak us layout via `setxkbmap`
#

[[ $(setxkbmap -print | grep -oP 'colemak') ]] \
  && setxkbmap -layout us \
  || setxkbmap -layout us -variant colemak_dh \
