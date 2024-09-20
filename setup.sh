sudo groupadd -r autologin
sudo gpasswd -a chris autologin

git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
