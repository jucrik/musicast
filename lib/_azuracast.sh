#!/bin/bash
# 
# update AzuraCast

get_update_azuracast() {
  print_banner
  printf "${YELLOW} ⬇️ Actualizando AzuraCast...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  cd ~
  cd /var/azuracast
  ./docker.sh update-self
  yes "" | ./docker.sh update
EOF

  sleep 2
}

# Actualización finalizada.
system_end_installation() {
  print_banner
  printf "${YELLOW} ✅ Actualización de AzuraCast finalizada con éxito.${GRAY_LIGHT}"
  printf "\n\n"
}
