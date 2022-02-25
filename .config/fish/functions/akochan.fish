function akochan
    set file_name /home/maillein/Downloads/(date '+%Y_%-m_%-d')_Jade_Room_South.json
    docker run --rm --volume /home/maillein/Downloads:/home/maillein/Downloads akochan-reviewer:latest \
        --no-open --use-placement-ev --without-viewer \
        # -n 0.005 \
        --in-file $file_name \
        -a (math ""(cat $file_name | jq -r '.name[]' | grep -n Maillein | string sub -s 1 -l 1)" - 1") -o - > ~/akochan-reviewer/report.html
    mv --backup=t $file_name /home/maillein/Downloads/検討済み牌譜/
end
