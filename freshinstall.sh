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
cat $HOME/.ssh/id_ed25519.pub
echo -e "\n"
read -r

# get my vim shit in here
git config --global user.email "$email"
git config --global user.name "$name"

rm $HOME/.bashrc
ln -s $HOME/.config/bash/bashrc $HOME/.bashrc

# install package managers
sudo apt-get install snap
sudo apt-get install snapd
sudo apt install flatpak
sudo apt install plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install applications
sudo apt install vim
sudo snap install install obsidian --classic
sudo snap install spotify
sudo apt install nvme-cli
sudo apt install git build-essential cmake extra-cmake-modules libkirigami-dev libkf5style-dev libkf6kcmutils-dev libkf6colorscheme-dev libkf5config-dev libkf5configwidgets-dev libkf5coreaddons-dev libkf5guiaddons-dev libkf6i18n-dev libkf6iconthemes-dev kirigami2-dev libkf6package-dev libkf6service-dev libkf6windowsystem-dev kwayland-dev libx11-dev libkdecorations3-dev libkf5configwidgets-dev libkf5i18n-dev libkf5iconthemes-dev libkf5kcmutils-dev libkf5package-dev libkf5service-dev libkf5wayland-dev libkf5windowsystem-dev libplasma-dev libqt5x11extras5-dev qt6-base-dev qt6-declarative-dev qtbase5-dev qtdeclarative5-dev gettext qt6-svg-dev
mkdir $HOME/Packages
git clone https://github.com/paulmcauley/klassy $HOME/Packages/klassy
cd $HOME/Packages/klassy
git checkout plasma6.3
./install
cd $HOME/.config

# setup vim
ln $HOME/.config/vim $HOME/.vim

# Setup Obsidian
mkdir $HOME/Obsidian
git clone git@github.com:Benjamin-Anderson-II/Idekyl.git $HOME/Obsidian/Idekyl

mkdir -p $HOME/CLASSES/CS_461
git clone git@github.com:Benjamin-Anderson-II/NVMeCLI_cmdTest.git $HOME/CLASSES/CS_461/NVMeCLI_cmdTest
sudo reboot
