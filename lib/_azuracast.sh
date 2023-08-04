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
  printf "${YELLOW} ✅ Instalación de Radio finalizada con éxito.${GRAY_LIGHT}"
  printf "\n\n"  
  printf "   [1] Regresar al Inicio para instalar Radio\n"
  printf "   [2] Salir\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    1)
      bash install_radio.sh && exit
      ;;

    2)
      cd ~
      rm -r /var/azuracast/radio-jucrik
      cd ~
      exit
      ;;

    *) exit ;;
  esac
}
