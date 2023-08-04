Versiones:<br>
[![Radio](https://img.shields.io/badge/Versión-v0.18.5-orange)](https://jucrik.com/streaming-de-audio)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-v20.04.4-orange)]()
[![Web](https://img.shields.io/badge/Sitio_Web-jucrik.com-blue)](https://jucrik.com/)

[![Donar](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/jucrik)
[![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?style=for-the-badge&logo=Instagram&logoColor=white)](https://instagram.com/jucrik)
[![WhatsApp](https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white)](https://wa.me/+593983927872)
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/@jucrik)

AzuraCast es una suite de gestión de radio web autoalojada, todo en uno. Gracias a su sencillo instalador y a su potente e intuitiva interfaz web, podrás poner en marcha una emisora de radio web totalmente operativa en pocos minutos.

Es útil para estaciones de radio web de todos los tipos y tamaños, y está construido para funcionar incluso en los hosts web VPS más asequibles.

# Requisitos del sistema
AzuraCast funciona con Docker y utiliza imágenes prediseñadas que contienen todos los componentes del software.

## Requerimientos mínimos
- Una CPU de 64 bits x86 (x86_64/amd64) o ARM64
- 2 GB de RAM
- 20 GB de espacio en disco duro
- Un servidor capaz de ejecutar Docker

## Requerimientos Recomendados
- 4 núcleos de CPU
- 4GB de RAM
- 40 GB o más de espacio en disco duro
- Un servidor capaz de ejecutar Docker

## Requerimientos Recomendados
Independientemente del sistema operativo que elija, para evitar problemas de compatibilidad o permisos, debe instalar AzuraCast en una instalación mínima nueva sin Docker o Docker Compose instalados.

- Ubuntu 22.04 LTS (solo Docker)
- Ubuntu 20.04 LTS (Ansible/Docker) (Altamente recomendado)
- Ubuntu 18.04 LTS (solo Docker)
- Debian 10 "Buster" (Ansible/Docker)
- Debian 9 "Estiramiento" (Ansible/Docker)
- MacOS: uso de Docker Desktop
- Windows 10: uso de Docker Desktop + WSL2
- Windows 11: uso de Docker Desktop + WSL2

## Puertos abiertos en el Firewall del servidor
- Puerto 80 (HTTP)
- Puerto 443 (HTTPS)
- Puerto 2022 (SFTP)
- Puertos de Radio del 8000 al 8496


# Instalación en VPS (Ubuntu 20.04 LTS)
Conéctese al servidor o computadora en la que desea instalar AzuraCast a través de un terminal SSH. Debe ser un usuario administrador con acceso root o la capacidad de usar el comando <code>sudo</code>. Si no es el usuario root, es posible que deba ejecutar <code>sudo su -</code> antes de ejecutar los comandos a continuación.

1. Elija un directorio base en su computadora host que AzuraCast pueda usar. Si está en Linux, puede seguir los pasos a continuación para usar el directorio recomendado:
```bash
apt install pv
mkdir -p /var/azuracast
cd /var/azuracast
```

2. Dentro del directorio creado, nos descargaremos el script del repositorio para poder instalarlo
```bash
curl -fsSL https://raw.githubusercontent.com/AzuraCast/AzuraCast/main/docker.sh > docker.sh
chmod a+x docker.sh
./docker.sh install
```

3. El script realizará una revisión al sistema operativo para saber si cumple con todos los requisitos, en este caso nos avisa de que docker-compose no se encuentra instalado, le decimos que lo instale con el comando <code>Y</code>.

4. Luego nos preguntará si quiere actualizar el paquete, como ya lo tenemos descargado desde el repositorio, le diremos <code>N</code> para que inicie con la instalación.

5. Cuando se haya descargado todos los contenedores, nos pedirá el idioma del instalador <code>es_ES</code>.

6. Dejamos los puertos por defecto cuando nos pregunte si los deseamos personalizar <code>no</code>.

7. Nos hará dos preguntas más, a ambas le decimos que <code>no</code>.

8. Una vez completada la instalación, debe visitar inmediatamente la dirección web pública de su servidor. Esta puede ser la IP del servidor, un nombre de dominio (si registró uno y lo apuntó al servidor) o localhost si está ejecutando AzuraCast en su computadora personal.

9. La configuración web inicial consta de los siguientes pasos:

- Creación de una cuenta de "superadministrador" con permisos de administración en todo el sistema.
- Creación de la primera emisora ​​de radio que gestionará el sistema.
- Personalización de configuraciones importantes de AzuraCast, como la URL base del sitio y la configuración de HTTPS.

[![Configuración]()](https://www.youtube.com/watch?v=m_D9ogDKXt8&t=1657s)

# Certificado SSL con LetsEncrypt
AzuraCast incluye compatibilidad integrada para crear y administrar certificados SSL (HTTPS) a través de LetsEncrypt desde el panel Configuración del sistema.

- AzuraCast debe estar en su propio dominio o subdominio. No puede configurar LetsEncrypt usando solo una dirección IP; debe tener un dominio (es decir, ejemplo.com) o un subdominio (radio.ejemplo.com) configurado para apuntar a su instalación de AzuraCast.
- El servidor web de AzuraCast se debe servir en los puertos predeterminados, 80 para HTTP y 443 para HTTPS. De manera predeterminada, AzuraCast ya está configurado de esta manera, pero si modificó los puertos para servir el sitio en un puerto secundario, debe volver a cambiar los puertos a los valores predeterminados al configurar LetsEncrypt y al realizar renovaciones.

## Habilitación de LetsEncrypt
1. Haga clic en el menú desplegable en la parte superior derecha, luego en "Administración del sistema".
2. Haga clic en "Configuración del sistema".
3. Seleccione la pestaña "Servicios".
4. Complete los campos de la sección LetsEncrypt.
5. Haga clic en "Guardar cambios" en la parte inferior.

El certificado HTTPS se generará automáticamente en los próximos minutos, pero puede hacerlo manualmente haciendo clic en el botón "Crear/Renovar certificado" debajo de los campos de LetsEncrypt.

Si los usuarios aún tienen problemas con el audio que no se reproduce, asegúrese de tener habilitada la opción "Usar proxy web" en la configuración del sistema.

## Renocación de LetsEncrypt
El servicio web renovará automáticamente sus certificados LetsEncrypt. Si proporciona un correo electrónico en el proceso de configuración inicial, ese correo electrónico se utilizará para enviarle recordatorios de la próxima caducidad en caso de que falle la renovación automática.

## Utilizar siempre HTTPS
Desde el panel "Configuración del sistema" dentro de AzuraCast, puede habilitar la configuración "Usar siempre HTTPS" en la pestaña "Seguridad y privacidad".

Una vez que esta configuración esté habilitada, no solo todos los usuarios serán redirigidos a la versión segura de AzuraCast cuando visiten, sino que también se habilitará HTTP Strict Transport Security (HSTS), lo que requiere un certificado SSL válido para funcionar. Esto mejora significativamente la seguridad de su conexión a AzuraCast y debe habilitarse siempre que sea posible.

# Uso de un certificado personalizado
Si tiene un certificado SSL personalizado en su host, debe crear el archivo <code>docker-compose.override.yml</code> en su directorio <code>/var/azuracast</code> con el contenido a continuación, modificado para reflejar su nombre de dominio y la ruta a su certificado y clave SSL:

services:<br>
&nbsp;&nbsp;web:<br>
&nbsp;&nbsp;&nbsp;&nbsp;volumes:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- /path/on/host/to/ssl.crt:/var/azuracast/acme/ssl.crt:ro<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- /path/on/host/to/ssl.key:/var/azuracast/acme/ssl.key:ro

# Actualización de AzuraCast
Si se desea después de actualizar AzuraCast se puede volver a instalar la personalización de Radio.
```bash
cd ~ && git clone https://github.com/jucrik/radio.git /var/azuracast/radio-jucrik && chmod -R 777 /var/azuracast/radio-jucrik && cd /var/azuracast/radio-jucrik && bash install_radio.sh
```
