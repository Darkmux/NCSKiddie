#!/bin/bash
#
# Variables y Colores
#
USER=$(id -u)
OS=$(uname -o)
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
		FILE="/data/data/com.termux/files/usr/etc/bash.bashrc"
	else
		FILE="/data/data/com.termux/files/usr/etc/bash.bashrc"
		pkg update && pkg upgrade -y
		pkg install netcat -y
	fi
	if [ -x ${PREFIX}/bin/pv ]; then
		FILE="/data/data/com.termux/files/usr/etc/bash.bashrc"
	else
		FILE="/data/data/com.termux/files/usr/etc/bash.bashrc"
		pkg update && pkg upgrade -y
		pkg install pv -y
	fi
else
	CheckRoot
	if [ -x /bin/nc ]; then
		FILE="/etc/bash.bashrc"
	else
		FILE="/etc/bash.bashrc"
		apt-get update && apt-get upgrade -y
		apt-get install netcat -y
	fi
	if [ -x /bin/pv ]; then
		FILE="/etc/bash.bashrc"
	else
		FILE="/etc/bash.bashrc"
		apt-get update && apt-get upgrade -y
		apt-get install pv -y
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
}
#
# Banner Facebook
#
function Banner {
	sleep 0.5
	clear
echo -e "${verde}
██╗    ██╗██╗  ██╗ █████╗ ████████╗███████╗ █████╗ ██████╗ ██████╗ 
██║    ██║██║  ██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗
██║ █╗ ██║███████║███████║   ██║   ███████╗███████║██████╔╝██████╔╝
██║███╗██║██╔══██║██╔══██║   ██║   ╚════██║██╔══██║██╔═══╝ ██╔═══╝ 
╚███╔███╔╝██║  ██║██║  ██║   ██║   ███████║██║  ██║██║     ██║     
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝"${blanco}
}
function Cuenta {
	Banner
echo -e -n "${verde}
┌══════════════════════════════┐
█ ${blanco}INGRESE EL NÚMERO TELEFÓNICO ${verde}█
└══════════════════════════════┘
┃
└═>>> "${blanco}
read -r ENLACE
sleep 0.5
}
function Analizando {
	Banner
echo -e "${verde}
┌═════════════════════════════════┐
█ ${blanco}ANALIZANDO NÚMERO TELEFÓNICO... ${verde}█
└═════════════════════════════════┘
┃"
echo -e "└═>>>${blanco} ${ENLACE}" |pv -qL 10
echo -e "${verde}"
echo -e "┌════════════════════════════════════════┐"
echo -e "█ ${blanco}██████████████████████████████████████ ${verde}█ 100%" |pv -qL 75
echo -e "└════════════════════════════════════════┘"
}
function Buscando {
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}NÚMERO TELEFÓNICO ENCONTRADO ${verde}█
└══════════════════════════════┘"${blanco}
sleep 3
echo -e "${verde}
┌══════════════════════════════════════════════════┐
█ ${blanco}EXTRAYENDO CÓDIGO DE VERIFICACIÓN DE WHATSAPP... ${verde}█
└══════════════════════════════════════════════════┘"${blanco}
sleep 3
echo -e "${verde}
┌═════════════════════════════════════════════════┐
█ ${blanco}ÉSTO PUEDE TARDAR UNOS MINUTOS, SEA PACIENTE... ${verde}█
└═════════════════════════════════════════════════┘"${blanco}
}
#
# Declarando Funciones
#
Dependencies
Cuenta
Analizando
Buscando
