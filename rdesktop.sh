#!/bin/sh
ip=$(zenity --title="遠端桌面連線" --text "輸入遠端IP：" --entry)
prog=$(zenity --height=300 --title="選擇連線方式" --text "請選擇" --list --radiolist --column="選擇" --column="連線" \
  TRUE rdesktop \
FALSE vncviewer )
$prog $ip
