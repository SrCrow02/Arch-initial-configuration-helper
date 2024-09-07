source ./arch.sh
source ./debian_distros.sh

echo "Which Linux is yours"
read CHOOSE

if [ "$CHOOSE" = "arch" ]; then
    arch_init
elif [ "$CHOOSE" = "debian" ]; then 
    debian_init

else 
    echo "Invalid choice"
    exit 1
fi
