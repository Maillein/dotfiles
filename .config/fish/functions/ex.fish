function ex --argument-names file --description "Extract the archive file"
    if test -f $argv
        switch $argv
            case '*.tar.bz2'
                tar xjvf $argv
            case '*.tar.gz'
                tar xzvf $argv
            case '*.bz2'
                bunzip2 $argv
            case '*.rar'
                unrar x $argv
            case '*.gz'
                gunzip $argv
            case '*.tar'
                tar xvf $argv
            case '*.tbz2'
                tar xjvf $argv
            case '*.tgz'
                tar xzvf $argv
            case '*.zip'
                unzip $argv
            case '*.Z'
                uncompress $argv
            case '.7z'
                7z x $argv
            case '*'
                echo "$argv cannot be extracted via ex"
        end
    else
        echo "$argv is not a valid file"
    end
end
