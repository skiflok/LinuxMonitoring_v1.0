#!/bin/bash

# Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)


if [ -f ./validation.sh ] 
then
    source ./validation.sh
else
    echo "Can't find file: ./validation.sh"
    exit 1
 fi

source ./os_info.sh
source ./color_management.sh

IFS=$'\n'

column1_background=4
column1_font_color=6
column2_background=3
column2_font_color=1
column1_background_status=" default"
column1_font_color_status=" default"
column2_background_status=" default"
column2_font_color_status=" default"


for color in $(cat color.conf)
do
    str=$(echo $color | awk -F= '{print $1}')
    if [ $str = "column1_background" ]; then
       column1_background=$(echo $color | awk -F= '{print $2}')
       column1_background_status=""
    elif [ $str = "column1_font_color" ]; then
       column1_font_color=$(echo $color | awk -F= '{print $2}')
       column1_font_color_status=""
    elif [ $str = "column2_background" ]; then
       column2_background=$(echo $color | awk -F= '{print $2}')
       column2_background_status=""
    elif [ $str = "column2_font_color" ]; then
       column2_font_color=$(echo $color | awk -F= '{print $2}')
       column2_font_color_status=""
    fi
done

for param in $(info)
do
    str=$(echo $param | awk -F= '{print $1 " ="}')
    WriteLine $str $column1_background $column1_font_color
    str=$(echo $param | awk -F= '{print " " $2}')
    WriteLine $str $column2_background $column2_font_color
    echo -e
done

echo -e

echo "Column 1 background ="$column1_background_status "("$(colorCast $column1_background)")"
echo "Column 1 font color ="$column1_font_color_status "("$(colorCast $column1_font_color)")"
echo "Column 2 background ="$column2_background_status "("$(colorCast $column2_background)")"
echo "Column 2 font color ="$column2_font_color_status "("$(colorCast $column2_font_color)")"


