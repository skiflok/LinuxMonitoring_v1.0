#!/bin/bash

if [ $# != 0 ]
then
    echo "ERROR: wrong number of parameters"
    exit 1
fi

if [ ! -f ./os_info.sh ] 
then
    echo "Can't find file: ./os_info.sh"
    exit 2
fi

if [ ! -f ./color_management.sh ] 
then
    echo "Can't find file: ./color_management.sh"
    exit 3
fi

if [ ! -f ./color.conf ] 
then
    echo "Can't find file: ./color.confh"
    exit 4
fi

for color in $(cat color.conf)
do
    num=$(echo $color | awk -F= '{print $2}')
    if [[ $num -lt 1 || $num -gt 6 ]]
    then
        echo "invalid parameter value"
        exit 5
    fi
done