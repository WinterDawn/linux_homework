#!/bin/bash
echo 'CPU AND MEMORY RESOURCES--------------------'
echo "CPU Load Average: `uptime | awk '{print $8 $9 $10}'`   Free RAM:`free -m | awk '/Mem/{print $4}'` MB"

echo 'NETWORK CONNECTIONS-------------------------'
echo "lo Bytes Received: `awk '/lo:/{print $2}' /proc/net/dev`   Bytes Transmitted: `awk '/lo:/ {print $10}' /proc/net/dev`"
echo "lo Bytes Received: `awk '/lo:/{print $2}' /proc/net/dev`   Bytes Transmitted: `awk '/lo:/ {print $10}' /proc/net/dev`"
CONN="No"
ping -c 1 -w 5 -t 64 www.google.com > /dev/null
if [ $? -eq 0 ]
then
        CONN="Yes"
fi
echo "Internet Connectivity: $CONN"

echo 'ACCOUNT INFORMATION-------------------------'
echo "Total Users: `cat /etc/passwd |wc -l` Number Active: `who | wc -l`"
echo "Shells:"
echo "`cat /etc/passwd | awk -F ":" '{print $7}' | awk '{for(i = 1; i <= NF; i++) {a[$i":"]++}} END {for(k in a) {print k, a[k]}}'`"

echo 'FILESYSTEM INFORMATION----------------------'
echo "Total Number Of Files: `find / -type f | wc -l`"
echo "Total Number Of Directories: `find / -type d | wc -l`"
