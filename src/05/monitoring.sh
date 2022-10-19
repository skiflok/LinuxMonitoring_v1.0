#!/bin/bash

WriteLine "Total number of folders (including all nested ones) =" 3
WriteLineLn $(sudo find $1 -type d 2> /dev/null | wc -l) 4

WriteLineLn "TOP 5 folders of maximum size arranged in descending order (path and size):" 1
IFS=$'\n'
i=0
for str in $(sudo du -h $1 2> /dev/null | sort -rhk1 | head -5 )
do
    i=$(( $i + 1 ))
    WriteLine $(echo $i" - ") 2
    WriteLine $(echo $(echo $str | awk '{print $2}')", ") 3
    WriteLine $(echo $str | awk '{print $1}') 4
    echo -e
done
WriteLineLn "etc up to $i" 1

WriteLine "Total number of files = " 3
WriteLineLn $( ls -laR $1 2> /dev/null | grep "^-" | wc | awk '{print $1}') 4

WriteLineLn "Number of:" 1

WriteLine "Configuration files (with the .conf extension) = " 3
WriteLineLn $(find $1 -depth -type f -name "*.conf" 2> /dev/null | wc -l) 4

WriteLine "Text files = " 3
WriteLineLn $(find $1 -depth -type f -name "*.txt" 2> /dev/null | wc -l) 4

WriteLine "Executable files = " 3
WriteLineLn $(find $1 -depth -type f -perm /a=x  2> /dev/null | wc -l) 4

WriteLine "Log files (with the extension .log) = " 3
WriteLineLn $(find $1 -depth -type f -name "*.log" 2> /dev/null | wc -l) 4

WriteLine "Archive files = " 3
WriteLineLn $(find $1 -depth -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" 2> /dev/null | wc -l) 4

WriteLine "Symbolic links = " 3
WriteLineLn $(find $1 -depth -type l 2> /dev/null | wc -l) 4

WriteLineLn "TOP 10 files of maximum size arranged in descending order (path, size and type):" 1
i=0
for str in $(sudo find $1 -type f -exec du -h {} + 2> /dev/null | sort -rhk1 | head)
do
    i=$(( $i + 1 ))
    WriteLine $(echo -n $i" - ") 2
    WriteLine $(echo -n $(echo $str | awk '{print $2}')", ") 3
    WriteLine $(echo -n $(echo $str | awk '{print $1}')", ") 4
    if ! [[ -z $(echo $str | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}') ]]
    then
        WriteLine $(echo $str | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}') 5
    fi
    echo -e
done
WriteLineLn "etc up to $i" 1

WriteLineLn "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):" 1
i=0
for str in $(sudo find $1 -type f -executable -exec du -h {} + 2> /dev/null | sort -rhk1 | head)
do
    i=$(( $i + 1 ))
    WriteLine $(echo -n $i" - ") 2
    WriteLine $(echo -n $(echo $str | awk '{print $2}')", ") 3
    WriteLine $(echo -n $(echo $str | awk '{print $1}')", " ) 4
    WriteLine $(echo $(echo $str | awk '{print $2}' | md5sum | awk '{print $1}')) 5
    echo -e
done
WriteLineLn "etc up to $i" 1