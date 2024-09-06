
#!/bin/bash

# Atualizar repositórios e pacotes
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

# Adicionar Rust ao PATH
# Esta linha deve ser adicionada ao perfil do usuário ou ser executada na mesma sessão
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Adicionar a chave do repositório do Bitwarden
wget -qO - https://keys.bitwarden.com/repo.gpg | sudo apt-key add -

# Adicionar o repositório do Bitwarden
echo "deb https://deb.bitwarden.com/ stable main" | sudo tee /etc/apt/sources.list.d/bitwarden.list

# Atualizar a lista de pacotes e instalar o Bitwarden
sudo apt update
sudo apt install -y bitwarden

