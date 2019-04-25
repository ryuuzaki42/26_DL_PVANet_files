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
# Script: Download all files/projects from PVANet
#
# Last update: 25/04/2019
#
#Tip: Read the readme.md file

fileToStart="a.php"
fileToWork="b.php"
folderToSave="tempDL"

iconv -f ISO-8859-1 -t UTF-8 "$fileToStart" > "$fileToWork"

filesLink=$(grep "href=" "$fileToWork" | cut -d '=' -f6 | cut -d '"' -f2 | grep "http")

# Convert in array
mapfile -t filesLinkArray <<< "$filesLink"

# get the length of the array
length=${#filesLinkArray[@]}

# Temp folder to download
mkdir "$folderToSave"
cd "$folderToSave" || exit

for ((i = 0; i < "$length"; i++)); do
    echo -e "\n $(( i + 1)) : wget -c ${filesLinkArray[$i]}\n"

    wget -c "${filesLinkArray[$i]}"
done

cd .. || exit
rm "$fileToWork"
