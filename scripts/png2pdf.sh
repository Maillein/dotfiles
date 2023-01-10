#!/usr/bin/zsh
PDF=$(basename "$(pwd)").pdf
convert $(ls | sort -n) -density 150 -resize 1240x "$PDF"
rm *.png
