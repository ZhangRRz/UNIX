BEGIN{
    targetDirectory="~/PA4/rooms/pokey/usr/toukmond/"
}
{
    while (1){
        printf("$ ")
        getline < "-"
        print($0)
        $0 = "_"$0
        gsub("<-", "\\-", $0)
        gsub("\\[", "\r", $0)
        gsub("\\?", "\v", $0)
        gsub("\\*", "\b", $0)
        if (NF==0) continue
        if ($1 == "_cat"){
            if (NF==1){
                print("Usage: cat <ascii-file-name>")
                continue
            }
            else if ("_"$2 ~ ".*/.*") print("cat: only files in current directory allowed.")
            else if (!find($2,1)) print("File not found.")
            else if ("_"$2 == "_description") system("cat "targetDirectory"description")
            else print("Ascii files only.")
        }
        else if ($1 == "_exit") exit
        else if ($1 == "_pwd"){
            ("cd "targetDirectory";pwd") | getline temp_dir
            sub("^.*pokey","",temp_dir)
            print(temp_dir"/")
        }
        else if ($1 == "_echo"){
            if (NF==1) print("")
            else{
                for (i=2;i<=NF;i++) {
                    if (i==NF) print($i)
                    else printf($i" ")
                }
            }
        }
        else if (($1 != "_ls") && ($1 != "_cd")){
            sub(".","",$1)
            gsub("\r", "[", $1)
            gsub("\v", "?", $1)
            gsub("\b", "*", $1)
            print($1": not found.")
        }
        else{
            if (NF==1){
                if ($1 == "_cd"){
                    print("Usage: cd <path>")
                    continue
                }
            }
            if ("_"$2 ~ "_/.*") $2 = "~/_/pokey"$2
            else if ("_"$2 ~ "_.+/.*"){
                ("cd "targetDirectory"; pwd") | getline temp_dir
                $2 = temp_dir"/"$2
                gsub("\n", "/", $2)
            }
            if ($2 != "" && !find($2,2))print("No such directory.")
            else if ($1 == "_cd"){
                ("cd "targetDirectory"; cd "$2"; pwd") | getline targetDirectory
                targetDirectory = targetDirectory "/"
            }
            else if ($1 == "_ls") system("cd "targetDirectory"; ls -rtl "$2" | sed 's/  */ /g' | cut -f3,4 --complement -d' ' |sed 's/+//; s/197[12]/1970/; s/  */ /g; /toukmond/!{/^d/bY};/des/!s/ . /@/; :Y; /@/!s/ [0-9][0-9]* /~/; s/~[^ ]{2,}/~2048/'|sed '2{h; s/./d/; s/[^ ]*$/./; s/[~@][0-9]*/~2048/;s/.*/&\\n&./; G; /10423/s/~/@/; s/2048/512/; };s/4096/0/;s/248/2048/;s/170/2048/;s/~/ 3 root     staff~/g; s/@/ 1 toukmond restricted~/g;s/~/             ~/g; s/\\([~@]\\)\\([^ ]*\\)/\\2\\1/g; tZ; :Z; s/\\([^\\n]\\{36\\}\\) \\(.....\\)~/\\1\\2~/; tZ; s/~//g'")
        }
    }
}


function find(target_to_find,file_or_dir){

    if(file_or_dir == 1){
        if (target_to_find ~ "\\.") return 1
        ("cd "targetDirectory";ls "target_to_find" -F 2> ~/X | wc -l") | getline result
        return result
    }
    else{
        if (system("cd "target_to_find" 2> ~/X") && system("cd "targetDirectory target_to_find" 2> ~/X"))return 0
        return 1
    }
}
