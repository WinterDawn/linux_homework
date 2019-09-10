#!/bin/bash
echo ''
echo "CPU Load Average: `uptime | awk '{print $8 $9 $10}'`   Free RAM:`free -m | awk '/Mem/{print $4}'` MB"
