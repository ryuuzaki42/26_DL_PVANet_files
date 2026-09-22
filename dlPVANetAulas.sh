#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre: você pode redistribuí-lo e/ou
# modificá-lo sob os termos da Licença Pública Geral GNU (GPL)
# conforme publicada pela Free Software Foundation, tanto a versão 3
# da licença, como (a seu critério) qualquer versão posterior.
#
# Este programa é distribuído na esperança de que seja útil,
# mas SEM NENHUMA GARANTIA; nem mesmo a garantia implícita de
# COMERCIABILIDADE ou ADEQUAÇÃO A UM PROPÓSITO ESPECÍFICO.
# Consulte a Licença Pública Geral do GNU para mais detalhes.
#
# Script: Baixe todos arquivos de aulas do PVANet
#
# Last update: 09/10/2022
#
# Dica: Leia o arquivo readme.md
#
fileToStart="a.html"
fileToWork="b.html"
startPage="https://www2.cead.ufv.br/sistemas/pvanet/"

# Convert to UTF-8
iconv -f ISO-8859-1 -t UTF-8 "$fileToStart" > "$fileToWork"

filesLink=$(grep "class='iframe' href=.*/files/conteudo/" "$fileToWork" | cut -d '=' -f6 | cut -d '/' -f2- | cut -d "'" -f1)

disciplinaNum=$(grep "disciplinas_titulo" "$fileToWork" | cut -d '>' -f4- | cut -d ' ' -f1-2 | tr -d ' ')
folderToSave="${disciplinaNum}_aulas"

if echo -e "$filesLink" | grep -q "www2.cead.ufv.br/sistemas/pvanet/"; then
    filesLink=$(echo -e "$filesLink" | grep "www2.cead.ufv.br/sistemas/pvanet/" | cut -d '/' -f5-)
fi

# Convert in array
mapfile -t filesLinkArray <<<"$filesLink"

# Get the length of the array
length=${#filesLinkArray[@]}

mkdir "arquivosBaixados" 2> /dev/null
cd "arquivosBaixados" || exit

# Temp folder to download
mkdir "$folderToSave" 2> /dev/null
cd "$folderToSave" || exit

for ((i = 0; i < "$length"; i++)); do
    echo -e "\n # $((i + 1)) de $length : wget -c $startPage${filesLinkArray[$i]}\n"

    wget -c "$startPage${filesLinkArray[$i]}"
done

echo -e " # Arquivos salvos em: $(pwd)/\n"
cd ../.. || exit
rm "$fileToWork"
