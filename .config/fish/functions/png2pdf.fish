function png2pdf
    convert (lsd | sort -n) -density 150 -resize 1240x (basename (pwd)).pdf
    rm *.png
    exit
end
