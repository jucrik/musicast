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
  cp -r /var/azuracast/radio-jucrik/img/login/* /var/lib/docker/overlay2/${folder_azuracast}/diff/var/azuracast/www/web/static/img
  sleep 2
  cd ~ && rm -r /var/azuracast/radio-jucrik
EOF

  sleep 2
}

# Instalación finalizada.
system_end_installation() {
  print_banner
  printf "${YELLOW} ✅ Instalación finalizada con éxito.${GRAY_LIGHT}"
  printf "\n\n"
}
