#!/bin/sh
text=$(zenity --title="文字內容" --text "輸入文字：" --entry)
output=$(zenity --title="輸出檔名" --text "輸出檔名：" --entry)
font=$(zenity --height=500 --width=800 --title="選擇字型" --text "請選擇" --list --radiolist \
  --column="選擇" --column="字檔" --column="名" --print-column=3 \
  TRUE wqy-micro /usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc \
  FALSE wqy-zen /usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc \
  FALSE 明體 /usr/share/fonts/TTF/uming.ttc \
  FALSE 楷體 /usr/share/fonts/TTF/ukai.ttc)
backcolor=$(zenity --title="背景色" --color-selection)
forecolor=$(zenity --title="前景色" --color-selection)
size=$(zenity --title="圖型大小" --text "設大小 128x128" --entry --entry-text "128x128")
echo $text $output $font $backcolor $forecolor $size

convert -background "$backcolor" -fill "$forecolor" -font $font \
       -size $size -gravity center label:"$text" output/$output
