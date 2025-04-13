#!/bin/bash

# Colores brillantes
brightRedColour="\e[1;31m\033[1m"
brightGreenColour="\e[1;32m\033[1m"
brightYellowColour="\e[1;33m\033[1m"
brightBlueColour="\e[1;34m\033[1m"
brightPurpleColour="\e[1;35m\033[1m"
brightCyanColour="\e[1;36m\033[1m"
brightWhiteColour="\e[1;37m\033[1m"
endColour="\033[0m\e[0m"

# Banner
figlet -f Bloody SubCheck | lolcat
echo -e "\t\t${brightPurpleColour}Live Subdomain Checker V1.0${brightEndColour}\n"
echo -e "\t\t\t\t\t\t\t${brightGreenColour}by enc0d3r${endColour}"

function ctrl_C(){
  echo -e "\n${brightRedColour}[!] Saliendo...${endColour}"
  exit 1
}

# Ctrl_C
trap ctrl_C INT

function helpPanel(){
  echo -e "\n${brightPurpleColour} Uso:${endcolour}${brightBlueColour} $0 -option${endColour}\n"
  echo -e "\t${brightPurpleColour}s)${endColour}${brightBlueColour} Subdominio[s] objetivo[s] (usa comillas dobles en esta opcion) ${endcolour}"
  echo -e "\t${brightPurpleColour}d)${endColour}${brightBlueColour} Dominio${endcolour}"
  echo -e "\t${brightPurpleColour}p)${endColour}${brightBlueColour} Puerto${endcolour}"
  echo -e "\t${brightPurpleColour}h)${endColour}${brightBlueColour} Mostrar este panel de ayuda${endcolour}"
}

function subdomainScan(){
  local subdomains=("${@:1:$#-2}")
  local domain="${@: -2:1}"
  local port="${@: -1}"

  for sub in "${subdomains[@]}"; do
    httpCode=$(curl -s -o /dev/null -w "%{http_code}" "http://$sub.$domain:$port")

    if [ "$httpCode" == "200" ]; then
      echo -e "\n${brightYellowColour}[+]${endColour}${brightGreenColour} $sub${endColour}${brightCyanColour} esta vivo${endColour}" >> liveSubdomains.txt
    else
      echo -e "\n${brightRedcolour}[!]${endColour}${brightGreenColour} $sub${endColour}${brightCyanColour} no esta vivo${endColour}"
    fi
  done
}

# Indicadores
declare -i triple_parametro=0

while getopts "d:s:p:h" arg; do
  case $arg in
    d) domain="$OPTARG"; let triple_parametro+=1;;
    s) IFS=',' read -ra subdomains <<< "$OPTARG"; let triple_parametro+=1;;
    p) port="$OPTARG"; let triple_parametro+=1;;
    h) helpPanel;;
  esac
done

# Condicionales
if [ $triple_parametro -eq 3 ]; then
   subdomainScan "${subdomains[@]}" $domain $port
else
  helpPanel
fi
