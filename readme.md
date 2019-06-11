# Script para facilitar o download de arquivos/projetos/aulas/práticas do PVANet #

## PVANet: https://www2.cead.ufv.br/sistemas/pvanet/

## Os arquivos são salvos por padrão na pasta: arquivosBaixados/

## Como utilizar:

### 1 Salve a página (pelo navegador em "salvar página como" ou crtl + s) que tem os links para baixar os arquivos (Trabalhos/Projetos/Práticas/Conteúdo/Material) com o nome: a.php

### 2 Execute o script para o tipo de específico de conteúdo da página:

### Para baixar arquivos de aulas [página Material]

`./dlPVANetAulas.sh`

### Para baixar Trabalhos/Projetos/Práticas [página Entrega de Tarefas]

`./dlPVANetPraticas.sh`

### Se os arquivos forem .txt e .cpp (práticas) e quiser renomear eles para .c, execute:
`./renameFiles.sh pasta/`
