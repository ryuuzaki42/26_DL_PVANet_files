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
# Script: Baixe todos arquivos de práticas/projetos dos alunos do PVANet
#
# Last update: 29/06/2020
#
# Dica: Leia o arquivo readme.md

fileToStart="a.php"
fileToWork="b.php"
startPage="https://www2.cead.ufv.br/sistemas/pvanet/"

# Convert to UTF-8
iconv -f ISO-8859-1 -t UTF-8 "$fileToStart" > "$fileToWork"

matricula=$(grep ">ER0" "$fileToWork" | cut -d '>' -f2 | cut -d '<' -f1 | cut -d ' ' -f1)
filesLink=$(grep "href=.*/files/trabalhos/" "$fileToWork" | cut -d '=' -f5 | cut -d '"' -f2 | cut -d '/' -f2-)
fileToDL=$(echo "$filesLink" | rev | cut -d '/' -f1 | rev)

if echo -e "$filesLink" | grep -q "www2.cead.ufv.br/sistemas/pvanet/"; then
    filesLink=$(echo -e "$filesLink" | grep "www2.cead.ufv.br/sistemas/pvanet/" | cut -d '/' -f5-)
fi

disciplinaNum=$(grep "disciplinas_titulo" "$fileToWork" | cut -d '>' -f4- | cut -d ' ' -f1-2 | tr -d ' ')
praticaName=$(grep "Tema" "$fileToWork" | cut -d '=' -f3 | cut -d '>' -f2 | cut -d '<' -f1 | sed 's/&.*;//g' | tr -d ' ')
folderToSave="${disciplinaNum}_$praticaName"

# Convert in array
mapfile -t matriculaArray <<<"$matricula"
mapfile -t filesLinkArray <<<"$filesLink"
mapfile -t fileToDLArray <<<"$fileToDL"

# Get the length of the array
length=${#matriculaArray[@]}

mkdir "arquivosBaixados" 2> /dev/null
cd "arquivosBaixados" || exit

# Temp folder to download
mkdir "$folderToSave"
cd "$folderToSave" || exit

for ((i = 0; i < "$length"; i++)); do
    echo -e "\n # $((i + 1)) de $length : wget -c $startPage${filesLinkArray[$i]} -O ${matriculaArray[$i]}_${fileToDLArray[$i]}\n"

    wget -c "$startPage${filesLinkArray[$i]}" -O "${matriculaArray[$i]}_${fileToDLArray[$i]}"
done

echo -e " # Arquivos salvos em: $(pwd)/\n"
cd ../.. || exit
rm "$fileToWork"
