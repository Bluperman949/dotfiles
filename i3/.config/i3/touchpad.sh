#
#  touchpad.sh
#  toggle touchpad on or off via `xinput`
#

id=$(xinput list | grep -oP 'Touchpad\s+id=\K\d+')

[[
  $(xinput list-props $id | \
  grep -oP "Device Enabled.*\K[01]$") -eq 0
]] \
  && xinput enable $id \
  || xinput disable $id \
