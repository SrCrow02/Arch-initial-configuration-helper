case $- in
*i*) ;;
*) return ;;
esac

export OSH='/home/gui/.oh-my-bash'

OSH_THEME="absimple"

OMB_USE_SUDO=true

completions=(
  git
  composer
  ssh
)

aliases=(
  general
  cargo
)

plugins=(
  git
  bashmarks
  blunder
  osx
)

source "$OSH"/oh-my-bash.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

clear
neofetch
