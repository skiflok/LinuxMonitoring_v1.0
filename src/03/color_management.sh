#!/bin/bash

useColor="true" # Установите значение на false, если вы обнаружите, что ваша среда плохо обрабатывает цвета.


function colorCast () {
    if [[ $1 -eq 1 ]]; then echo "White"
    elif [[ $1 -eq 2 ]]; then echo "Red"
    elif [[ $1 -eq 3 ]]; then echo "Green"
    elif [[ $1 -eq 4 ]]; then echo "Blue"
    elif [[ $1 -eq 5 ]]; then echo "Purple"
    elif [[ $1 -eq 6 ]]; then echo "Black"
    fi
}

# Возвращает код цвета для заданных цветов переднего/заднего плана
# Этот код передаётся эхом в терминал перед выводом текста
# для создания цветного вывода.
#
# строка foreground (основной цвет) имя_цвета. Необязательна, если не задан фон.
#        По умолчанию "Default", который использует системный цвет по умолчанию
# строка background (фон) имя_цвета. Необязательна. По умолчанию используется $color_background
#        который устанавливается на основе текущего фона терминала.
# возвращает строку
function Color () {

    local background=$(colorCast $1)
    local foreground=$(colorCast $2)

    if [ "$foreground" == "" ];  then foreground="Default"; fi
    if [ "$background" == "" ]; then background="$color_background"; fi

    local colorString='\033['



    # Основные цвета
    case "$foreground" in
        "Default")      colorString='\033[0;39m';;
        "Purple" )      colorString='\033[0;35m';;       
        "Black" )       colorString='\033[0;30m';;
        "DarkRed" )     colorString='\033[0;31m';;
        "DarkGreen" )   colorString='\033[0;32m';;
        "DarkYellow" )  colorString='\033[0;33m';;
        "DarkBlue" )    colorString='\033[0;34m';;
        "DarkMagenta" ) colorString='\033[0;35m';;
        "DarkCyan" )    colorString='\033[0;36m';;
        "Gray" )        colorString='\033[0;37m';;
        "DarkGray" )    colorString='\033[1;90m';;
        "Red" )         colorString='\033[1;91m';;
        "Green" )       colorString='\033[1;92m';;
        "Yellow" )      colorString='\033[1;93m';;
        "Blue" )        colorString='\033[1;94m';;
        "Magenta" )     colorString='\033[1;95m';;
        "Cyan" )        colorString='\033[1;96m';;
        "White")       colorString='\033[1;97m';;
        *)              colorString='\033[0;39m';;
    esac

    # Цвета фона
    case "$background" in
        "Default" )     colorString="${colorString}\033[49m";;
        "Purple" )      colorString="${colorString}\033[45m";;
        "Black" )       colorString="${colorString}\033[40m";;
        "DarkRed" )     colorString="${colorString}\033[41m";;
        "DarkGreen" )   colorString="${colorString}\033[42m";;
        "DarkYellow" )  colorString="${colorString}\033[43m";;
        "DarkBlue" )    colorString="${colorString}\033[44m";;
        "DarkMagenta" ) colorString="${colorString}\033[45m";;
        "DarkCyan" )    colorString="${colorString}\033[46m";;
        "Gray" )        colorString="${colorString}\033[47m";;
        "DarkGray" )    colorString="${colorString}\033[100m";;
        "Red" )         colorString="${colorString}\033[101m";;
        "Green" )       colorString="${colorString}\033[102m";;
        "Yellow" )      colorString="${colorString}\033[103m";;
        "Blue" )        colorString="${colorString}\033[104m";;
        "Magenta" )     colorString="${colorString}\033[105m";;
        "Cyan" )        colorString="${colorString}\033[106m";;
        "White" )       colorString="${colorString}\033[107m";;
        *)              colorString="${colorString}\033[49m";;
    esac

    echo "${colorString}"
}

# Выводит строку (включая перевод на строку) на терминал, используя заданные основной или фоновый 
# цвета
#
# строка The text to output (Текст для вывода). Необязательна, если не задан основной цвет. По умолчанию выводится только перевод на строку.
# строка Foreground color name (Имя основного цвета). Необязательна, если не указан фон. По умолчанию "Default", который
#        использует системное значение по умолчанию
# строка Background color name (Имя фонового цвета). Необязательна. По умолчанию используется $color_background, который устанавливается на основе
#        текущего фона терминала
function WriteLine () {

    local resetColor='\033[0m'

    local str=$1
    local backcolor=$2
    local forecolor=$3

    if [ "$str" == "" ]; then
        printf "\n"
        return;
    fi

    # Обратите внимание на использование форматного заполнителя %s. Это позволяет нам передавать "--" в качестве строк без ошибок
    if [ "$useColor" == "true" ]; then
        local colorString=$(Color ${backcolor} ${forecolor})
        printf "${colorString}%s${resetColor}" "${str}"
    else
        printf "%s" "${str}"
    fi
}