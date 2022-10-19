#!/bin/bash


if [ -f ./validation.sh ] 
then
    source ./validation.sh
else
    echo "Can't find file: ./validation.sh"
    exit 1
 fi

source ./os_info.sh
source ./color_management.sh

# info

IFS=$'\n'

for param in $(info)

do
    str=$(echo $param | awk -F= '{print $1 " ="}')
    WriteLine $str $1 $2
    str=$(echo $param | awk -F= '{print " " $2}')
    WriteLine $str $3 $4
    echo -e
done
