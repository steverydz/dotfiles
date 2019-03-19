#!/bin/bash

set -e

# Install all required snaps
declare -a snaps=(
  "bitwarden"
  "irccloud-desktop"
  "journey"
  "lxd"
  "spotify"
  "vlc"
  "vscode"
)

for item in ${snaps[@]}; do
  if $item == "vscode"
    sudo snap install $item --classic
  else
    sudo snap install $item
  fi
done


# Add charles proxy ppa
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
sudo sh -c 'echo deb https://www.charlesproxy.com/packages/apt/ charles-proxy main > /etc/apt/sources.list.d/charles.list'


# Install all required apt packages
sudo apt-get update

declare -a apts=(
  "ack-grep"
  "build-essential"
  "chrome-gnome-shell"
  "curl"
  "docker-compose"
  "git"
  "python3.6"
  "python3-pip"
  "python3-venv"
  "ruby-full"
  "tmux"
  "vim"
  "wget"
  "xclip"
  "zsh"
)

for item in ${apts[@]}; do
  sudo apt-get install $item -y
done


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


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


# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


# Clone and symlink dotfiles
git clone git@github.com:steverydz/dotfiles ~/.dotfiles

declare -a dotfiles=(
  ".ackrc"
  ".gitconfig"
  ".gitignore"
  ".tmux.conf"
  ".vimrc"
  ".zshrc"
)

for item in ${dotfiles[@]}; do
  rm -rf ~/$item
  ln -s ~/.dotfiles/$item ~/$item
done

source ~/.bashrc
