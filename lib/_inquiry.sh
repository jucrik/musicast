#!/bin/bash


# Instalar Radio de Jucrik.
folder_search() {
  print_banner
  printf "${YELLOW} 🔎 Buscando la carpeta codificada donde se instaló AzuraCast...${GRAY_LIGHT}\n"
  find /var/lib/docker/overlay2/ -name main.phtml
  printf "\n Cuando hayas copiado el nombre de la carpeta codificada, presione ENTER para continuar..."
  read -p "> " folder_search
}

get_folder_azuracast() {
  print_banner
  printf "${YELLOW} 📂 Pegue aquí el nombre de la carpeta codificada:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " folder_azuracast
}

get_urls() {
  folder_search
  get_folder_azuracast
}

get_update_radio() {
  get_folder_azuracast
}

#get_update_azuracast() {
#  get_
#}

inquiry_options() {
  
  print_banner
  printf "${YELLOW} 🚀 ¡Bienvenido al instalador de Radio de Jucrik.com! Selecciona la siguiente acción para continuar:${GRAY_LIGHT}"
  printf "\n\n"
  printf "   [1] Instalar Radio de Jucrik.com\n"
  printf "   [2] Radio ya está instalado en mi sistema, solo quiero actualizarlo\n"
#  printf "   [3] Actualizar Azuracast\n"
  printf "   [4] Mejor en otra ocasión\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    1)
      get_urls
      ;;

    2)
      get_update_radio
      ;;

    3)
      get_update_azuracast
      ;;

    4)
      exit
      ;;

    *) exit ;;
  esac
}
