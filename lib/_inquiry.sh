#!/bin/bash

folder_search() {
  print_banner
  printf "${YELLOW} 🔎 Buscando la carpeta codificada donde se instaló AzuraCast...${GRAY_LIGHT}\n"
  find /var/lib/docker/overlay2/ -name main.phtml
  printf "\n"
  printf "Cuando hayas copiado el nombre de la carpeta codificada, presione ENTER para continuar.\n"
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

inquiry_options() {
  
  print_banner
  printf "${YELLOW} 🚀 ¡Bienvenido al instalador de Radio de Jucrik.com! Selecciona la siguiente acción para continuar:${GRAY_LIGHT}"
  printf "\n\n"
  printf "   [1] Personalizar Radio de Jucrik.com\n"
  printf "   [2] Actualizar Azuracast (después de actualizar es necesario volver a personalizar)\n"
  printf "   [3] Salir\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    1)
      get_urls
      ;;

    2)
      bash update_azuracast.sh && exit
      ;;

    3)
      cd ~ && rm -r /var/azuracast/radio-jucrik && exit
      ;;

    *) exit ;;
  esac
}
