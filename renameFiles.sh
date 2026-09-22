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
# Script: Rename the files .txt and .cpp to .c
#
# Last update: 09/10/2022
#
# Tip: Read the readme.md file
#
folderToWork=$1
if [ "$folderToWork" == '' ]; then
    echo -e "$RED\\nError: You need pass the folder to work"
else
    echo -e "\n### Rename *.txt to .c ###\n"
    for file in "$folderToWork"/*.txt; do
        echo "$file to ${file::-4}.c"
        mv "$file" "${file::-4}.c"
    done

    echo -e "\n### Rename *.cpp to .c ###\n"
    for file in "$folderToWork"/*.cpp; do
        echo "$file to ${file::-4}.c"
        mv "$file" "${file::-2}"
    done
fi
