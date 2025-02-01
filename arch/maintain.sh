#!/bin/bash

maintain_arch() {
    echo "### Atualizando pacotes do sistema..."
    sudo pacman -Syu --noconfirm

    # Remover pacotes órfãos
    echo "### Removendo pacotes órfãos..."
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm

    # Limpeza de cache
    echo "### Limpando o cache de pacotes..."
    sudo pacman -Scc --noconfirm
    sudo paccache -r --noconfirm

    # Atualização AUR
    echo "### Atualizando pacotes do AUR..."
    yay -Syu --noconfirm

    # Limpeza de logs antigos
    echo "### Limpando logs antigos..."
    sudo journalctl --vacuum-time=2weeks --noconfirm

    # Verificação de dependências quebradas
    echo "### Verificando dependências quebradas..."
    sudo pacman -Qk --noconfirm

    # Backup de arquivos de configuração
    echo "### Fazendo backup de arquivos importantes..."
    mkdir -p ~/backups
    cp -r ~/.bashrc ~/.config ~/backups/

    # Verificar status do firewall (UFW)
    if systemctl is-active --quiet ufw; then
        echo "### UFW está ativo, atualizando regras..."
        sudo ufw reload --noconfirm
    else
        echo "### UFW não está ativo. Ativando firewall..."
        sudo pacman -S --noconfirm ufw
        sudo systemctl enable ufw --now --noconfirm
        sudo ufw default deny incoming --noconfirm
        sudo ufw default allow outgoing --noconfirm
        sudo ufw allow ssh --noconfirm
        sudo ufw enable --noconfirm
    fi

    # Verificar a integridade do sistema de arquivos
    echo "### Verificando sistema de arquivos..."
    sudo fsck -A -a --noconfirm

    # Status do uso do disco
    echo "### Status do uso do disco..."
    df -h

    # Status da memória
    echo "### Status da memória..."
    free -h

    # Status do sistema com Neofetch
    echo "### Status do sistema..."
    neofetch

    echo "### Manutenção concluída!"
}

