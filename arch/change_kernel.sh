#!/bin/bash

change_kernel() {
    # Instala o kernel LTS e seus headers
    echo "### Instalando o kernel LTS e seus headers..."
    sudo pacman -S linux-lts linux-lts-headers --noconfirm

    # Se desejar remover o kernel padrão (opcional)
    # echo "### Removendo o kernel atual..."
    # sudo pacman -Rns linux --noconfirm

    echo "### O kernel LTS foi instalado. Por favor, reinicie e escolha o kernel LTS no GRUB."
}