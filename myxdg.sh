#!/bin/bash

read -p "Esse script vai mudar os nomes nos diretórios padrões da home e só deve ser executado após dar stow no 'homedirs', deseja continuar? (Y/n) " resposta

resposta=${resposta:-Y}

resposta=$(echo "$resposta" | tr '[:upper:]' '[:lower:]')

if [[ "$resposta" == "y" ]]; then
    [ -d "$HOME/Documentos" ]         && mv "$HOME/Documentos" "$HOME/documents"
    [ -d "$HOME/Modelos" ]            && mv "$HOME/Modelos" "$HOME/modelos"
    [ -d "$HOME/Público" ]            && mv "$HOME/Público" "$HOME/public"
    [ -d "$HOME/Área de Trabalho" ]   && mv "$HOME/Área de Trabalho" "$HOME/desktop"
    [ -d "$HOME/Downloads" ]          && mv "$HOME/Downloads" "$HOME/downloads"
    [ -d "$HOME/Imagens" ]            && mv "$HOME/Imagens" "$HOME/images"
    [ -d "$HOME/Música" ]             && mv "$HOME/Música" "$HOME/music"
    [ -d "$HOME/Vídeos" ]             && mv "$HOME/Vídeos" "$HOME/videos"

    echo ""
    echo ""

    if [ -f "$HOME/.config/user-dirs.dirs" ]; then
            echo "Atualizando ~/.config/user-dirs.dirs..."
            xdg-user-dirs-update
    else
            echo "Aviso: ~/.config/user-dirs.dirs não encontrado. Nada foi atualizado."
    fi
        
else
    echo 'Processo cancelado'
fi

