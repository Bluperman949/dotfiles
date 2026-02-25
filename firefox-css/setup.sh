dest="~/.mozilla/firefox/*.default-release"
dest=$(eval "echo $dest")
echo -n "@$dest/chrome" > .lndot
