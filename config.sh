#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Instalar pacotes essenciais
sudo apt install -y vim neovim falkon git curl build-essential kitty

# Criar um novo usuário e definir senha
sudo useradd -m new_user
echo "new_user:password" | sudo chpasswd
sudo usermod -aG sudo new_user

# Instalar Node.js (versão 14) e Docker
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs docker.io neofetch

# Baixar e instalar o Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

wget -qO - https://keys.bitwarden.com/repo.gpg | sudo apt-key add -

echo "deb https://deb.bitwarden.com/ stable main" | sudo tee /etc/apt/sources.list.d/bitwarden.list

sudo apt update
sudo apt install -y bitwarden

git config --global user.name "Seu nome"
git config --global user.email "seu_email@example.com"
git config --global core.editor "vim"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

echo '*.log' >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

