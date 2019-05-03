# Script para facilitar o download de arquivos/projetos/aulas/práticas do PVANet #

## PVANet: https://www2.cead.ufv.br/sistemas/pvanet/

## Os arquivos são salvos por padrão na pasta: arquivosBaixados/

## Como utilizar:

### 1 Salve a página (pelo navegador em "salvar página como") que tem os links para baixar os arquivos (Trabalhos/Projetos/Práticas/Conteúdo) com o nome: a.php

### 2 Execute o script para o tipo de específico de conteúdo da página:

### Para baixar arquivos de aulas [página Conteúdo] (Acesso: Aluno(a) e Professor(a))

`./dlPVANetAulas.sh`

### Para baixar Trabalhos/Projetos/Práticas (Acesso: Apenas Professor(a))

`./dlPVANetPraticas.sh`

### Se os arquivos forem .txt e .cpp (práticas) e quiser renomear eles para .c, execute:
`./renameFiles.sh Pasta/`
