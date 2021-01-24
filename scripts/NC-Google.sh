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
echo -e "${rojo}
 ${azul}██████╗  ${rojo}██████╗  ${amarillo}██████╗  ${azul}██████╗ ${verde}██╗     ${rojo}███████╗
${azul}██╔════╝ ${rojo}██╔═══██╗${amarillo}██╔═══██╗${azul}██╔════╝ ${verde}██║     ${rojo}██╔════╝
${azul}██║  ███╗${rojo}██║   ██║${amarillo}██║   ██║${azul}██║  ███╗${verde}██║     ${rojo}█████╗  
${azul}██║   ██║${rojo}██║   ██║${amarillo}██║   ██║${azul}██║   ██║${verde}██║     ${rojo}██╔══╝  
${azul}╚██████╔╝${rojo}╚██████╔╝${amarillo}╚██████╔╝${azul}╚██████╔╝${verde}███████╗${rojo}███████╗
 ${azul}╚═════╝  ${rojo}╚═════╝  ${amarillo}╚═════╝  ${azul}╚═════╝ ${verde}╚══════╝${rojo}╚══════╝"${blanco}
}
function Cuenta {
	Banner
echo -e -n "${rojo}
┌═══════════════════════════════════════┐
█ ${azul}INGRESE EL CORREO ELECTRÓNICO ${blanco}(GMAIL) ${rojo}█
└═══════════════════════════════════════┘
┃
└═>>> "${blanco}
read -r ENLACE
sleep 0.5
}
function Analizando {
	Banner
echo -e "${rojo}
┌═══════════════════════════┐
█ ${azul}BUSCANDO CUENTA GOOGLE... ${rojo}█
└═══════════════════════════┘
┃"
echo -e "└═>>>${blanco} ${ENLACE}" |pv -qL 10
echo -e "${rojo}"
echo -e "┌════════════════════════════════════════┐"
echo -e "█ ${blanco}██████████████████████████████████████ ${rojo}█ 100%" |pv -qL 75
echo -e "└════════════════════════════════════════┘"
}
function Buscando {
echo -e "${rojo}
┌══════════════════════════┐
█ ${azul}CUENTA GOOGLE ENCONTRADA ${rojo}█
└══════════════════════════┘"${blanco}
sleep 3
echo -e "${rojo}
┌════════════════════════════════════════════┐
█ ${azul}BUSCANDO CONTRASEÑA EN LA BASE DE DATOS... ${rojo}█
└════════════════════════════════════════════┘"${blanco}
sleep 3
echo -e "${rojo}
┌═════════════════════════════════════════════════┐
█ ${azul}ÉSTO PUEDE TARDAR UNOS MINUTOS, SEA PACIENTE... ${rojo}█
└═════════════════════════════════════════════════┘"${blanco}
}
#
# Declarando Funciones
#
Dependencies
Cuenta
Analizando
Buscando
