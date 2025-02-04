#!/bin/bash

arch_init() {
    # Atualiza o sistema
    sudo pacman -Syu --noconfirm

    # Instala pacotes essenciais
    sudo pacman -S --noconfirm gparted apparmor vlc npm docker vim neovim falkon git curl base-devel kitty code ranger neofetch rsync fail2ban clamav discord nvm docker-compose nmap mps-youtube ufw

    # Ativar e configurar apparmor
    sudo systemctl enable apparmor
    sudo systemctl start apparmor

    # Ativar e configurar fail2ban (Proteção contra Brute Force)
    sudo systemctl enable fail2ban --now

    # Instalar e configurar o Tor e Tor Browser
    sudo pacman -S --noconfirm tor tor-browser

    # Configuração do Oh My Bash
    curl -fsSL https://github.com/ohmybash/oh-my-bash/raw/master/tools/install.sh | bash

    # Configurar tema e plugins do Oh My Bash
    echo 'export OSH="/home/$USER/.oh-my-bash"' >> ~/.bashrc
    echo 'export OSH_THEME="agnoster"' >> ~/.bashrc  # Escolhendo o tema agnoster
    echo 'export OSH_PLUGINS="git command-not-found"' >> ~/.bashrc  # Plugins do git e comando não encontrado
    echo 'source $OSH/oh-my-bash.sh' >> ~/.bashrc

    # Instalar o Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

    # Configurar Bitwarden com a chave GPG (caso o Bitwarden esteja disponível diretamente no pacman)
    wget -qO - https://keys.bitwarden.com/repo.gpg | sudo pacman-key --add -
    sudo pacman-key --lsign-key 9EAFACBF1B8E0F3C3C46765E5B4A4B6344C84E47
    echo "[bitwarden]
    SigLevel = Optional TrustAll
    Server = https://deb.bitwarden.com/ stable main" | sudo tee /etc/pacman.conf.d/bitwarden.conf

    # Definindo aliases do Git
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status

    # Ignorar logs no Git
    echo '*.log' >> ~/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global

    # Configuração do UFW (Firewall)
    sudo systemctl enable ufw --now

    sudo cp -f ./kitty/kitty.conf ~/.config/kitty/kitty.conf
    sudo cp -f ./bash/aliases ~/.oh-my-bash
    sudo cp -f ./bash/.bashrc ~/.bashrc
}