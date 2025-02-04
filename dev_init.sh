source ./arch/arch.sh
source ./arch/change_kernel.sh
source ./arch/maintain.sh
source ./debian/debian_distros.sh

install_git() {
    if ! command -v git &> /dev/null
    then    
        echo "Git não encontrado. Instalando"
        sudo pacman -S --noconfirm git
    else  
        echo "Git já está instalado."
    fi
}   

echo "What do u want to do?"
read CHOOSE

if [ "$CHOOSE" = "maintain-arch" ]; then
    maintain_arch
elif [ "$CHOOSE" = "arch-init" ]; then
    install_git

    echo "Enter your git username:"
    read GIT_USERNAME
    echo "Enter your git email"
    read GIT_EMAIL

    git config --global user.name "$GIT_USERNAME"
    git config --global.email "$GIT_EMAIL"
    git config --global core.editor "nvim"
    
    arch_init
elif [ "$CHOOSE" = "init-debian" ]; then 
    debian_init
elif [ "$CHOOSE" = "change-kernel" ]; then
    change_kernel

else 
    echo "Invalid choice"
    exit 1
fi
