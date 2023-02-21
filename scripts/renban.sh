#!/usr/bin/zsh

for FILE in $(sh -c "ls -rt *.{png,jpg,jpeg,gif} 2> /dev/null"); do
  local filename=$(echo $FILE | cut -f 1 -d '.')
  convert $FILE "$filename.png"
done
sh -c "rm *.{jpg,jpeg,gif} 2> /dev/null"
ls -rt *.png | awk '{ printf "mv %s %03d.png\n", $0, NR }' | sh
