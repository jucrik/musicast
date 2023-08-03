#!/bin/bash

get_folder_azuracast() {
  print_banner
  printf "${YELLOW} 📂 Escriba el nombre de la carpeta codificada donde se instaló azuracast:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " folder_azuracast
}

get_urls() {
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
