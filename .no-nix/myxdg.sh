#!/bin/bash

read -p "This script will change the names in the default home directories and should only be executed after '.config/user-dirs.dirs' is properly configured by home.nix or stow in 'homedirs' (deprecated). Do you wish to continue? (Y/n) " resposta

resposta=${resposta:-Y}

resposta=$(echo "$resposta" | tr '[:upper:]' '[:lower:]')

if [[ "$resposta" == "y" ]]; then
    echo "Starting directory renaming process..."
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
            echo "Updating ~/.config/user-dirs.dirs..."
            xdg-user-dirs-update
    else
            echo "Error: Failed to update ~/.config/user-dirs.dirs."
    fi
        
else
    echo 'Process canceled'
fi

