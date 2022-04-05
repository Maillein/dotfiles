function jpg2pdf
    find . -type f -print0 -name '*.jpg' | xargs -0 -n 5 -P 8 mogrify -format png
    rm *.jpg
    convert (lsd | sort -n) -density 150 -resize 1240x (basename (pwd)).pdf
    rm *.png
end
