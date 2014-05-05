#!/bin/sh
# http://www.imagemagick.org/Usage/text/
# http://note2share.com/post/6f07f100-17be-4e00-aefd-7220d3c69866
# convert -list font ==> list fonts
# chinese font:
# /usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc
# /usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc
# /usr/share/fonts/TTF/uming.ttc
# /usr/share/fonts/TTF/ukai.ttc
# 
#convert -background lightblue -fill blue -font "/usr/share/fonts/TTF/uming.ttc" \
convert -background lightblue -fill blue -font "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" \
            -pointsize 20 -size 128x128 -gravity center label:"$1" $2
