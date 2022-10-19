#!/bin/bash

info () {
echo HOSTNAME = `hostname`
echo TIMEZONE = $(cat /etc/timezone) $(date -u "+%Z %-z")
echo USER = `whoami`
echo OS = $(cat /etc/issue | awk '{print $1,$2,$3}')
echo DATE = $(date "+%d %b %Y %H:%M:%S")
echo UPTIME = `uptime -p`
echo UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')
echo IP = $(hostname -I)
echo MASK = $(route -n | sed -n '4'p | awk '{print $3}') 
echo GATEWAY = $(ip r | grep default | awk '{print $3}')
echo RAM_TOTAL = $(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
echo RAM_USED = $(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
echo RAM_FREE = $(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
echo SPACE_ROOT = $(df /root/ | awk '/dev/ {printf "%.2f MB", $2/1024}')
echo SPACE_ROOT_USED = $(df /root/ | awk '/dev/ {printf "%.2f MB", $3/1024}')
echo SPACE_ROOT_FREE = $(df /root/ | awk '/dev/ {printf "%.2f MB", $4/1024}')
}
