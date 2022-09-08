#!/bin/bash

aspect_width=4
aspect_height=3

in=$1
out=$2

width=`convert "$in" -format "%[w]" info:`
height=`convert "$in" -format "%[h]" info:`

echo width is $width
echo height is $height

target_aspect_ratio=`echo $aspect_width/$aspect_height | bc -l`
image_aspect_ratio=`convert "$in" -format "%[fx:w/h]" info:`

echo target_aspect_ratio is $target_aspect_ratio
echo image_aspect_ratio is $image_aspect_ratio

new_height=`echo $width/$target_aspect_ratio | bc`
#convert -define png:size=2560x1920 "${in}" -alpha off -thumbnail '450x345>' \
#        -background black -gravity center -extent 450x345 "${out}"

convert -define png:size=2560x1920 "${in}" -alpha off -thumbnail '450x345>' \
        -background black -gravity center -extent 319x213 "${out}"
