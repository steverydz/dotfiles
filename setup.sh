#!/bin/bash

# Install all required snaps
declare -a snaps=(
  "bitwarden"
  "firefox"
  "gimp"
  "irccloud-desktop"
  "lxd"
  "spotify"
  "vscode --classic"
  "vlc"
)

for item in ${snaps[@]}; do
  sudo snap install $item
done


# Install all required apt packages
sudo apt-get update

declare -a apts=(
  "ack-grep"
  "bash-complettion"
  "curl"
  "docker-compose"
  "git"
  "python3.6"
  "python3-pip"
  "vim"
  "virtualenv"
  "virtualenvwrapper"
  "wget"
  "zsh"
)

for item in ${apts[@]}; do
  sudo apt-get install $item -y
done


# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts


# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install --no-install-recommends yarn -y


# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ${whoami}


# Clone and symlink dotfiles
git clone git@github.com:steverydz/dotfiles ~/.dotfiles

declare -a dotfiles=(
  ".ackrc"
  ".bash_profile"
  ".bashrc"
  ".aliases"
  ".gitconfig"
  ".gitignore"
  ".vimrc"
)

for item in ${dotfiles[@]}; do
  rm -rf ~/$item
  ln -s ~/.dotfiles/$item ~/$item
done

source ~/.bashrc


# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
