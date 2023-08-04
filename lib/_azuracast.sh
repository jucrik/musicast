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
system_end_update() {
  print_banner
  printf "${YELLOW} ✅ Instalación de MusiCast finalizada con éxito.${GRAY_LIGHT}"
  printf "\n\n"  
  printf "   [1] Regresar al Inicio para instalar MusiCast\n"
  printf "   [2] Salir\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    1)
      bash musicast.sh && exit
      ;;

    2)
      cd ~ && rm -r /var/azuracast/musicast && exit
      ;;

    *) exit ;;
  esac
}
