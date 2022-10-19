#!/bin/bash

if [ $# != 0 ]
then
    echo "ERROR: wrong number of parameters"
    exit 1
else
    if [ -f ./os_info.sh ] 
    then

        source ./os_info.sh
        info
        read -p "Do you want to save data into file? (Y/N): " user_answer

        if [[ $user_answer == "Y" || $user_answer == "y" ]]
        then
            echo $user_answer
            info >> $(date "+%d_%m_%y_%H_%M_%S").status
        fi

    else
        echo "Can't find file: ./os_info.sh"
        exit 2
    fi
fi
