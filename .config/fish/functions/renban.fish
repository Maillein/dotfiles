function renban --description "画像ファイルをタイムスタンプ順に連番pngに変換"
  for file in (ls -rt *.{png,jpg,jpeg,gif})
    set filename (echo $file | cut -f 1 -d '.')
    convert $file "$filename.png"
  end
  rm *.{jpg,jpeg,gif}
  lsd -rt *{.png,*.jpg} | awk '{ printf "mv %s %03d.png\n", $0, NR }' | sh
end
