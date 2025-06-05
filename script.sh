#!/bin/zsh

sudo pacman -Syu --noconfirm
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

if ! command -v yay &> /dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

[[ "$SHELL" != */zsh ]] && chsh -s $(which zsh)

