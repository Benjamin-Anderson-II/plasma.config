#!/bin/bash

email="benjaminalandersonii@gmail.com"
name="Benjamin Anderson II"

if [ $USER = root ]; then
    echo "Exitting: leave root and re-run"
    exit
fi

# Add self to sudoers
su -p -c "cat >> /etc/sudoers <<<'$USER ALL=(ALL:ALL) NOPASSWD:ALL'"

# Create new ssh key
ssh-keygen -t ed25519 -C "$email"
echo -e "Enter the following into GitHub now.\n"
cat ~/.ssh/id_ed25519.pub
echo -e "\n"
read -r

# clone .vim
git config --global user.email "$email"
git config --global user.name "$name"
git clone git@github.com:Benjamin-Anderson-II/.vim.git ~/.vim

rm ~/.bashrc
ln -s ~/.config/bash/bashrc ~/.bashrc

# install things
sudo apt-get install snap
sudo apt-get install snapd
sudo apt install flatpak
sudo apt install plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo snap install install obsidian --classic
sudo snap install spotify
sudo apt install nvme-cli
sudo apt install git build-essential cmake extra-cmake-modules libkirigami-dev libkf5style-dev libkf6kcmutils-dev libkf6colorscheme-dev libkf5config-dev libkf5configwidgets-dev libkf5coreaddons-dev libkf5guiaddons-dev libkf6i18n-dev libkf6iconthemes-dev kirigami2-dev libkf6package-dev libkf6service-dev libkf6windowsystem-dev kwayland-dev libx11-dev libkdecorations3-dev libkf5configwidgets-dev libkf5i18n-dev libkf5iconthemes-dev libkf5kcmutils-dev libkf5package-dev libkf5service-dev libkf5wayland-dev libkf5windowsystem-dev libplasma-dev libqt5x11extras5-dev qt6-base-dev qt6-declarative-dev qtbase5-dev qtdeclarative5-dev gettext qt6-svg-dev
mkdir ~/Packages
git clone https://github.com/paulmcauley/klassy ~/Packages/klassy
cd ~/Packages/klassy
git checkout plasma6.3
./install
cd ~/.config

# Setup Obsidian
mkdir ~/Obsidian
git clone git@github.com:Benjamin-Anderson-II/Idekyl.git ~/Obsidian/Idekyl

mkdir -p ~/CLASSES/CS_461
git clone git@github.com:Benjamin-Anderson-II/NVMeCLI_cmdTest.git ~/CLASSES/CS_461/NVMeCLI_cmdTest
sudo reboot
