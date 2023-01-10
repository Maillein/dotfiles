#!/usr/bin/zsh
PAIFU="$HOME/Downloads/`date '+%Y_%-m_%-d'`_Jade_Room_South.json"
docker run --rm --volume "$HOME/Downloads:$HOME/Downloads" mjai-reviewer:latest \
  -e akochan \
  --akochan-tactics ./tactics.json \
  --player-name Maillein \
  -i $PAIFU \
  --no-open \
  -o - \
  > $HOME/mjai-reviewer/report.html
mv --backup=t $PAIFU $HOME/Downloads/検討済み牌譜/
