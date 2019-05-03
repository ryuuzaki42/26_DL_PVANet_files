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
# Script: Baixe todos arquivos de aulas do PVANet
#
# Last update: 03/05/2019
#
# Dica: Leia o arquivo readme.md

fileToStart="a.php"
fileToWork="b.php"
startPage="https://www2.cead.ufv.br/sistemas/pvanet/"

# Convert to UTF-8
iconv -f ISO-8859-1 -t UTF-8 "$fileToStart" > "$fileToWork"

filesLink=$(grep "href=.*/files/conteudo/" "$fileToWork" | cut -d '=' -f6 | cut -d '/' -f2- | cut -d "'" -f1)

disciplinaNum=$(grep "disciplinas_titulo" "$fileToWork" | cut -d '>' -f4- | cut -d ' ' -f1-2 | tr -d ' ')
folderToSave="${disciplinaNum}_aulas"

# Convert in array
mapfile -t filesLinkArray <<<"$filesLink"

# Get the length of the array
length=${#filesLinkArray[@]}

mkdir "arquivosBaixados" 2> /dev/null
cd "arquivosBaixados" || exit

# Temp folder to download
mkdir "$folderToSave"
cd "$folderToSave" || exit

for ((i = 0; i < "$length"; i++)); do
    echo -e "\n # $((i + 1)) de $length : wget -c $startPage${filesLinkArray[$i]}\n"

    wget -c "$startPage${filesLinkArray[$i]}"
done

echo -e " # Arquivos salvos em: $(pwd)/\n"
cd ../.. || exit
rm "$fileToWork"
