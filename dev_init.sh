source ./arch/arch.sh
source ./arch/change_kernel.sh
source ./arch/maintain.sh
source ./debian/debian_distros.sh

echo "What do u want to do?"
read CHOOSE

if [ "$CHOOSE" = "maintain-arch" ]; then
    maintain_arch
elif [ "$CHOOSE" = "arch-init" ]; then
    arch_init
elif [ "$CHOOSE" = "init-debian" ]; then 
    debian_init
elif [ "$CHOOSE" = "change-kernel" ]; then
    change_kernel

else 
    echo "Invalid choice"
    exit 1
fi
