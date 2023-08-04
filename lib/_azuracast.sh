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
  printf "¿Deseas regresar al Inicio para instalar Radio? Y/N\n" radio
  read -p "> "
    if [ "$radio" != "Y" ]
then
    bash install_radio && exit
else
    cd ~ && rm -r /var/azuracast/radio-jucrik && exit
fi
