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
echo -e "${morado}
${morado}███████╗██████╗ ███████╗███████╗    ${amarillo}███████╗██╗██████╗ ███████╗
${morado}██╔════╝██╔══██╗██╔════╝██╔════╝    ${amarillo}██╔════╝██║██╔══██╗██╔════╝
${morado}█████╗  ██████╔╝█████╗  █████╗      ${amarillo}█████╗  ██║██████╔╝█████╗  
${morado}██╔══╝  ██╔══██╗██╔══╝  ██╔══╝      ${amarillo}██╔══╝  ██║██╔══██╗██╔══╝  
${morado}██║     ██║  ██║███████╗███████╗    ${amarillo}██║     ██║██║  ██║███████╗
${morado}╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝    ${amarillo}╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝"${blanco}
}
function Diamantes {
	Banner
echo -e -n "${morado}
┌══════════════════════════════════════════┐
█ ${amarillo}¿CUÁNTOS DIAMANTES GRATIS DESEA GENERAR? ${morado}█
└══════════════════════════════════════════┘
┃    ┌══════════════════════┐
└═>>>█ [${blanco}01${morado}] ┃ ${amarillo}100 DIAMANTES ${morado}█
┃    └══════════════════════┘
┃    ┌══════════════════════┐
└═>>>█ [${blanco}02${morado}] ┃ ${amarillo}300 DIAMANTES ${morado}█
┃    └══════════════════════┘
┃    ┌══════════════════════┐
└═>>>█ [${blanco}03${morado}] ┃ ${amarillo}500 DIAMANTES ${morado}█
┃    └══════════════════════┘
┃
└═>>> "${blanco}
read -r diamantes
sleep 0.5
}
function Cuenta {
echo -e -n "${morado}
┌════════════════════════════┐
█ ${amarillo}INGRESE EL ID DE SU CUENTA ${morado}█
└════════════════════════════┘
┃
└═>>> "${blanco}
read -r ENLACE
sleep 0.5
}
function Analizando {
echo -e "${morado}
┌═════════════════════════════════┐
█ ${amarillo}BUSCANDO CUENTA DE FREE FIRE... ${morado}█
└═════════════════════════════════┘
┃"
echo -e "└═>>>${blanco} ${ENLACE}" |pv -qL 10
echo -e "${morado}"
echo -e "┌════════════════════════════════════════┐"
echo -e "█ ${blanco}██████████████████████████████████████ ${morado}█ 100%" |pv -qL 75
echo -e "└════════════════════════════════════════┘"
}
function Buscando {
echo -e "${morado}
┌════════════════════════════════┐
█ ${amarillo}CUENTA DE FREE FIRE ENCONTRADA ${morado}█
└════════════════════════════════┘"${blanco}
sleep 3
echo -e "${morado}
┌════════════════════════════════════┐
█ ${amarillo}AÑADIENDO DIAMANTES A LA CUENTA... ${morado}█
└════════════════════════════════════┘"${blanco}
sleep 3
echo -e "${morado}
┌═════════════════════════════════════════════════┐
█ ${amarillo}ÉSTO PUEDE TARDAR UNOS MINUTOS, SEA PACIENTE... ${morado}█
└═════════════════════════════════════════════════┘"${blanco}
}
#
# Declarando Funciones
#
Dependencies
Diamantes
Cuenta
Analizando
Buscando
