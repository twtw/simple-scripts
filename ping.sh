#!/bin/bash
#set -vx


###### Test rseau #########


ping -q -c 2 google.com >/dev/null 2>&1 
if [ $? -eq 0 ]; then 
    zenity --info --text="Network OK" --timeout 2
  else 
    zenity --warning --text="No network ?" --timeout 2 || exit 0
fi
