function mkcd --argument-names dir --description "Make directory and Change current directory"
    mkdir -p $argv && cd $argv 
end
