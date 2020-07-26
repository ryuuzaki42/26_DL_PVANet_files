## Comandos úteis

# Gerar arquivos .c com todos códigos
    name=$(pwd | rev | cut -d '/' -f1 | rev).c; cat * > ../"$name"

# Quantidade de arquivos .txt|.TXT
    i=0; IFS=$(echo -en "\n\b"); for file in $(ls *.txt *.TXT); do ((i++)); done; echo -e "\nTem $i arquivo(s) .txt|.TXT"

# Ronomear arquivos .txt|.TXT para .c
    i=1; IFS=$(echo -en "\n\b"); for file in $(ls *.txt *.TXT); do echo "$i"; ((i++)); mv -v "$file" "${file::-4}.c"; done

# Converter arquivos ISO-8859-1 / latini para UTF-8
    IFS=$(echo -en "\n\b"); for file in $(file *.c | grep 8859 | cut -d ':' -f1); do iconv -f iso-8859-1 -t utf-8 "$file" > "${file::-2}_n.c"; done

        mkdir oldLatini; IFS=$(echo -en "\n\b"); for file in $(file *.c | grep 8859 | cut -d ':' -f1); do mv -v "$file" oldLatini; done

            rm -r oldLatini

# Remover acentos
    IFS=$(echo -en "\n\b"); for file in $(ls *.c); do echo "$file"; cat "$file" | ../remove_acentos > "${file::-2}_afc.c"; done

        mkdir newFiles; mv *_afc.c newFiles/

            rm *.c; mv newFiles/*.c .; rmdir newFiles
