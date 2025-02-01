#!/bin/bash

arch_init() {
    # Atualiza o sistema
    sudo pacman -Syu --noconfirm

    # Instala yay
    sudo pacman -S --noconfirm yay gparted

    sudo pacman -S --noconfirm apparmor
    sudo systemctl enable apparmor
    sudo systemctl startapparmor

    sudo pacman -S --noconfirm vlc # para video

    # Instalar pacotes essenciais e ferramentas com yay
    yay -S --noconfirm npm docker vim neovim falkon git curl base-devel kitty code ranger neofetch rsync fail2ban clamav discord nvm docker-compose nmap mps-youtube

    # Ativar e configurar fail2ban (Proteção contra Brute Force)
    sudo systemctl enable fail2ban --now

    # Instalar e configurar Bitwarden usando yay
    yay -S --noconfirm bitwarden

    # Instalar e configurar o Tor e Tor Browser
    yay -S --noconfirm tor tor-browser

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

    # Configurar Bitwarden com a chave GPG
    wget -qO - https://keys.bitwarden.com/repo.gpg | sudo pacman-key --add -
    sudo pacman-key --lsign-key 9EAFACBF1B8E0F3C3C46765E5B4A4B6344C84E47
    echo "[bitwarden]
    SigLevel = Optional TrustAll
    Server = https://deb.bitwarden.com/ stable main" | sudo tee /etc/pacman.conf.d/bitwarden.conf

    # Configuração do Git
    git config --global user.name "Seu nome"
    git config --global user.email "seu_email@example.com"
    git config --global core.editor "nvim"

    # Definindo aliases do Git
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status

    # Ignorar logs no Git
    echo '*.log' >> ~/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global

    # Configuração do UFW (Firewall)
    sudo pacman -S --noconfirm ufw
    sudo systemctl enable ufw --now
}