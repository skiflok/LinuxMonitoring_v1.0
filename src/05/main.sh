#!/bin/bash

if [ -f ./validation.sh ] 
then
    source ./validation.sh
else
    echo "Can't find file: ./validation.sh"
    exit 1
fi

source ./color_management.sh


 # начало скрипта
START=$(date +%s)

source ./monitoring.sh

# конец скрипта
END=$(date +%s)
DIFF=$(( $END - $START ))
WriteLine $(echo "Script execution time (in seconds) = $DIFF") 2
echo -e
