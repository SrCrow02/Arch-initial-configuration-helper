#!/bin/bash

arch_init() {
    sudo pacman -Syu --noconfirm

    sudo pacman -S --noconfirm vim neovim falkon git curl base-devel kitty

    # Create a new user and password
    # sudo useradd -m new_user
    # echo "new_user:password" | sudo chpasswd
    # sudo usermod -aG wheel new_user

    sudo pacman -S --noconfirm nodejs npm docker

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

    wget -qO - https://keys.bitwarden.com/repo.gpg | sudo pacman-key --add -
    sudo pacman-key --lsign-key 9EAFACBF1B8E0F3C3C46765E5B4A4B6344C84E47
    echo "[bitwarden]
    SigLevel = Optional TrustAll
    Server = https://deb.bitwarden.com/ stable main" | sudo tee /etc/pacman.conf.d/bitwarden.conf

    sudo pacman -Syu --noconfirm bitwarden

    sudo pacman -S --noconfirm tor tor-browser

    git config --global user.name "Seu nome"
    git config --global user.email "seu_email@example.com"
    git config --global core.editor "nvim"

    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status

    echo '*.log' >> ~/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global
}