#!/usr/bin/zsh
find . -type f -print0 -name '*.jpg' | xargs -0 -n 5 -P 8 mogrify -format png
rm *.jpg
PDF=$(basename "$(pwd)").pdf
convert $(ls | sort -n) -density 150 -resize 1240x "$PDF"
rm *.png
