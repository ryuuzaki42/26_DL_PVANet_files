#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Script: Rename the files .txt and .cpp to .c
#
# Last update: 02/05/2019
#
#Tip: Read the readme.md file

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
