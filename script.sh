#!/bin/zsh

# Cores para mensagens
GREEN='\033[0;32m'
NC='\033[0m' # Sem cor

echo -e "${GREEN}==> Atualizando sistema (sem forçar downgrade)...${NC}"
sudo pacman -Syu --noconfirm

echo -e "${GREEN}==> Instalando pacotes principais via pacman...${NC}"
sudo pacman -S --noconfirm \
  base-devel \
  jdk-openjdk \
  openssl \
  ctags \
  ncurses \
  the_silver_searcher \
  fontconfig \
  imagemagick \
  libmagick \
  git \
  curl \
  zsh

# Verifica se o yay está instalado
if ! command -v yay &> /dev/null; then
  echo -e "${GREEN}==> yay não encontrado, instalando yay (AUR helper)...${NC}"
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
else
  echo -e "${GREEN}==> yay já está instalado.${NC}"
fi

# Mudar o shell padrão para zsh se ainda não for
if [[ "$SHELL" != */zsh ]]; then
  echo -e "${GREEN}==> Alterando shell padrão para zsh...${NC}"
  chsh -s $(which zsh)
else
  echo -e "${GREEN}==> zsh já é o shell padrão.${NC}"
fi

echo -e "${GREEN}✔ Ambiente de desenvolvimento configurado com sucesso!${NC}"

