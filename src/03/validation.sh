#!/bin/bash

if [ $# != 4 ]
then
    echo "ERROR: wrong number of parameters"
    exit 1
fi

for param in "$@"
do
    if [[ $param -lt 1 || $param -gt 6 ]]
    then
        echo "invalid parameter value"
        exit 3
    fi
done

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