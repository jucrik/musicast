#!/bin/bash
# 
# system management

# Instalar Radio de Jucrik.
system_copy_files() {
  print_banner
  printf "${YELLOW} ⬇️ Instalando Radio...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  cd ~
  cp /var/azuracast/radio-jucrik/img/hexbg.png /var/lib/docker/overlay2/${folder_azuracast}/diff/var/azuracast/www/web/static/img/hexbg.png
EOF

  sleep 2
}

# Instalación finalizada.
system_end_installation() {
  print_banner
  printf "${YELLOW} ✅ Instalación finalizada...${GRAY_LIGHT}"
  printf "\n\n"
}
