#!/bin/bash

if [ $# != 1 ]
then
    echo "ERROR: wrong number of parameters"
    exit 2
fi

if [[ "${1: -1}" != "/" ]]; then
    echo "ERROR: Wrong path!"
    exit 1
fi

if [ ! -d $1 ]
then
    echo "ERROR: $1 — is not a directory"
    exit 2
fi


if [ ! -f ./monitoring.sh ] 
then
    echo "Can't find file: ./monitoring.sh"
    exit 3
fi

if [ ! -f ./color_management.sh ] 
then
    echo "Can't find file: ./color_management.sh"
    exit 4
fi

