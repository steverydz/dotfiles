# Dotfiles

These dotfiles are customised for me. You are welcome to use them but I do not offer any support for them.

## Packages to install

```
sudo apt update && sudo apt install curl docker-compose git gnome-tweaks net-tools python3-pip python3-venv tmux vim wget zsh xclip -y
```

## Snaps to install

```
snap install bitwarden
snap install code --classic
snap install dotrun
```

## Install Google Chrome

[Download Google Chrome](https://www.google.co.uk/chrome/)

## Install tmux package manager

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Copy dotfiles to home directory

See [setup.sh](setup.sh)

## xclip alias

Add this to `~/.zshrc`

```
alias pbcopy="xclip -sel clip"
```

## Add Docker group

```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

## SSH key

[Generate SSH key for github](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Install tools

- [Install oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Install nvm](https://github.com/nvm-sh/nvm)
- [Install yarn](https://classic.yarnpkg.com/en/docs/install/#debian-stable)
- [Install nordvpn](https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Elementary-OS-and-Linux-Mint.htm)

## Setup VSCode

[Settings sync extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)

## Disable emoji keyboard

1. Go to Settings > Language and Region
2. Click "Manage Installed Languages"
3. Change "Keyboard input method system" to "XIM"

## Settings

Use system settings and Gnome Tweaks to make settings adjustments accordingly
