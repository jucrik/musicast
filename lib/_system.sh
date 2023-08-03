#!/bin/bash
# 
# system management

# Clonar el repositorio de Radio.
system_git_clone() {
  print_banner
  printf "${YELLOW} ⬇️ Descargando la aplicación...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  git clone https://github.com/jucrik/radio.git /var/azuracast/radio-jucrik
EOF

  sleep 2
}

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
