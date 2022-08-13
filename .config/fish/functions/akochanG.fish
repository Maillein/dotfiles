function akochanG
  set file_name /home/maillein/Downloads/(date '+%Y_%-m_%-d')_Gold_Room_South.json
  docker run --rm --volume /home/maillein/Downloads:/home/maillein/Downloads mjai-reviewer:latest \
    -e akochan \
    #--akochan-tactics ./akochan/setup_mjai.json \
    --akochan-tactics ./tactics.json \
    --player-name Maillein \
    -i $file_name \
    --no-open \
    # --without-log-viewer \
    -o - \
    > ~/akochan-reviewer/report.html
  mv --backup=t $file_name /home/maillein/Downloads/検討済み牌譜/
end
