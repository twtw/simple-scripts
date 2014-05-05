#!/bin/sh
#http://www.imagemagick.org/discourse-server/viewtopic.php?f=2&t=15492&p=54769&hilit=circle+mask#p54769
#convert y.png \
#     \( +clone  -alpha extract \
#        -draw 'fill black polygon 0,0 0,15 15,0 fill white circle 15,15 15,0' \
#        \( +clone -flip \) -compose Multiply -composite \
#        \( +clone -flop \) -compose Multiply -composite \
#     \) -alpha off -compose CopyOpacity -composite ys.png 
convert $1 \
\( +clone -threshold -1 -negate -fill white -draw "circle 64,64 64,0" \) \
-alpha off -compose copy_opacity -composite $2
