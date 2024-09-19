sudo groupadd -r autologin
sudo gpasswd -a chris autologin
systemctl enable lightdm

git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
