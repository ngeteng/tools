#! /bin/bash
printf "Tunggu Sedang Menginstall... " >&2
{
sudo useradd -m sans
sudo adduser sans sudo
echo 'sans:8426' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser sans chrome-remote-desktop
} &> /dev/null &&
printf "\nInstall Berhasil " >&2 ||
printf "\nBuka Mata Lo Ajg " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Debian Linux dan Paste\n'
read -p "Paste Disini : " CRP
su - sans -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Selesai " >&2
else
    printf "\n\nBuka Mata Lo Ajg " >&2
fi
