#!/bin/bash

# Directories
CONFIG="$HOME/.config"
OBSIDIAN="$HOME/Obsidian"
PACKAGES="$HOME/Packages"
SSH="$HOME/.ssh"
BASH="$CONFIG/bash"
FONTS="$CONFIG/fonts"

# Git variables
EMAIL="benjaminalandersonii@gmail.com"
NAME="Benjamin Anderson II"

if [ $USER = root ]; then
    echo "Exitting: leave root and re-run"
    exit
fi

# Add self to sudoers
su -p -c "cat >> /etc/sudoers <<<'$USER ALL=(ALL:ALL) NOPASSWD:ALL'"

# Create new ssh key
ssh-keygen -t ed25519 -C "$EMAIL"
echo -e "Enter the following into GitHub now.\n"
cat $SSH/id_ed25519.pub
echo -e "\n"
read -r

# Git config stuff
git config --global pull.rebase false
ln -s $CONFIG/.gitconfig $HOME/.gitconfig

rm $HOME/.bashrc
ln -s $CONFIG/bash/bashrc $HOME/.bashrc

# install package managers
sudo apt-get install snap
sudo apt-get install snapd
sudo apt install flatpak
sudo apt install plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install applications
sudo apt install fzf
sudo apt install bat
sudo apt install ripgrep
sudo apt install silversearcher-ag
sudo apt install git-delta
sudo apt install perl
sudo apt install universal-ctags
sudo apt install vim
sudo snap install install obsidian --classic
sudo snap install spotify
flatpak install discord
sudo apt install nvme-cli
sudo apt install git build-essential cmake extra-cmake-modules libkirigami-dev libkf5style-dev libkf6kcmutils-dev libkf6colorscheme-dev libkf5config-dev libkf5configwidgets-dev libkf5coreaddons-dev libkf5guiaddons-dev libkf6i18n-dev libkf6iconthemes-dev kirigami2-dev libkf6package-dev libkf6service-dev libkf6windowsystem-dev kwayland-dev libx11-dev libkdecorations3-dev libkf5configwidgets-dev libkf5i18n-dev libkf5iconthemes-dev libkf5kcmutils-dev libkf5package-dev libkf5service-dev libkf5wayland-dev libkf5windowsystem-dev libplasma-dev libqt5x11extras5-dev qt6-base-dev qt6-declarative-dev qtbase5-dev qtdeclarative5-dev gettext qt6-svg-dev
mkdir $PACKAGES
git clone https://github.com/paulmcauley/klassy $PACKAGES/klassy
cd $PACKAGES/klassy
git checkout plasma6.3
./install.sh
cd $CONFIG

# setup vim
ln -s $CONFIG/vim $HOME/.vim

# Setup Obsidian
mkdir $OBSIDIAN
git clone git@github.com:Benjamin-Anderson-II/Idekyl.git $OBSIDIAN/Idekyl

# NVMe cli tester
mkdir -p $HOME/CLASSES/CS_461
git clone git@github.com:Benjamin-Anderson-II/NVMeCLI_cmdTest.git $HOME/CLASSES/CS_461/NVMeCLI_cmdTest
cd $CONFIG

# FaB Sides Scheduler
mkdir $HOME/code
git clone git@github.com:Benjamin-Anderson-II/FaB-Sides-Scheduler.git $HOME/code/Fab-Sides-Scheduler

# link fonts into .local and reload them
ln -s $FONTS $HOME/.local/share/fonts
fc-cache -fv

git remote set-url origin git@github.com:Benjamin-Anderson-II/plasma.config.git
sudo reboot
