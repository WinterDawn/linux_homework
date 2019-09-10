#!/bin/bash
THRES=80
ROOT_USE=$(df / | awk '/[0-9]{1,2}%/{print $5-0}')
BOOT_USE=$(df /boot | awk '/[0-9]{1,2}%/{print $5-0}')
if [ $ROOT_USE -ge $THRES ]
then
        SUBJECT="/ utilization exceeds $THRES %"
        mail -s "$SUBJECT" root@localhost < /dev/null
fi
if [ $BOOT_USE -ge $THRES ]
then
        SUBJECT="/boot utilization exceeds $THRES %"
        mail -s "$SUBJECT" root@localhost < /dev/null
fi
