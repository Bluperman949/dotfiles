sudo pacman -S git github-cli
sudo groupadd -r autologin
sudo gpasswd -a chris autologin

git auth login

git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ..

yay -S - < packages.txt
