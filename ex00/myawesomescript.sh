#!/bin/bash
# Define el color verde utilizando secuencias de escape ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
# Restaura el color original de la consola
NC='\033[0m'

url=$1

# $# -ne 1 checks if the number of arguments is not equal to 1 and -z "$url" checks if the URL is empty 
if [ $# -ne 1 ] || [ -z "$url" ]; then
    echo -e "${RED}You must provide a URL as an argument!${NC}"
   
    exit 1
fi
resolv=$(curl -X HEAD -I -s $url | grep location | cut -c 11-)
if [ -z $resolv ]; then
    echo -e "${RED}The URL is not valid!${NC}"
    exit 1
else
    echo -e "${GREEN}$resolv${NC}"
    exit 0
fi
