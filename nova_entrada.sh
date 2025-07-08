#!/bin/bash

# Pede o título ao usuário
echo "Qual o título da sua entrada?"
read -r titulo

# Verifica se o título está vazio. Se estiver, cancela a operação.
if [ -z "$titulo" ]; then
    echo "O título não pode ser vazio. Operação cancelada."
    exit 1
fi

# Pede o conteúdo principal da entrada
echo "Digite o texto da sua entrada. Pressione Ctrl+D quando terminar para salvar."
conteudo=$(cat)

# --- Formatação dos dados ---

# Capitaliza a primeira letra do título (requer bash 4.0+)
titulo_formatado="${titulo^}"

# Pega a data no formato DD/MM/YYYY
data_formatada=$(date "+%d/%m/%Y")

# Pega a hora no formato HH:MM (sem segundos)
hora_formatada=$(date "+%H:%M")

# Gera o nome do arquivo com o timestamp completo para garantir que seja único
nome_arquivo=$(date "+%Y-%m-%d_%H-%M-%S").txt

# --- Criação do arquivo ---

# Usa um "Here Document" (cat <<EOF) para criar o conteúdo formatado e salvar no arquivo
cat <<EOF > "$nome_arquivo"
Título: ${titulo_formatado}
Data: ${data_formatada}
Hora: ${hora_formatada}
--------------------
${conteudo}
EOF

echo "Diário atualizado! Entrada salva no arquivo: ${nome_arquivo}"