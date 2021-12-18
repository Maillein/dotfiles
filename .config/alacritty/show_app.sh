#!/bin/sh

if [ $# -ne 2 ]
  then
  echo "Pass 2 params"
  echo -e "show_app.sh <Window Title to check for> <app to open>"
  echo -e "\nNotes\n\t<Window url> should be an exact string match"
  echo -e "\t<app to open> should be path to the executable"
  exit
fi

AWK_STRING="{ if (\$4 == \"$1\") print \$1 }"
PROGRAM_WINDOW_ID=`wmctrl -l | tr -s ' ' | awk "$AWK_STRING" `

if [ ${#PROGRAM_WINDOW_ID} -gt 0 ]; 
then 
  xprop -id $PROGRAM_WINDOW_ID  | grep _NET_WM_STATE_FOCUSED 1>/dev/null
  if [ $? -eq 0 ];
  then 
    echo "Focused->Hidden";
    # 非表示
    wmctrl -F -i -r "$PROGRAM_WINDOW_ID" -b toggle,hidden
    # タスクバーから消す
    wmctrl -F -i -r "$PROGRAM_WINDOW_ID" -b add,skip_taskbar
  else
    echo "Hidden/Unfocused->Focused"
    # 今いるワークスペースに非表示のウィンドウを移動
    wmctrl -F -i -r "$PROGRAM_WINDOW_ID" -t $(xdotool get_desktop_for_window $(xdotool getactivewindow))
    # ウィンドウにフォーカスを当てる
    wmctrl -F -i -a "$PROGRAM_WINDOW_ID" 
    # タスクバーに表示
    wmctrl -F -i -r "$PROGRAM_WINDOW_ID" -b remove,skip_taskbar
  fi
  echo ${#string}
else 
    echo "Starting Alacritty";
  sh -c $2 &
fi
