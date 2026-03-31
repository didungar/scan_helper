#!/bin/bash

INPUT_DIR="./"
OUTPUT="resultat.pdf"

# Vérifie qu'il y a des fichiers
files=("$INPUT_DIR"/*.jpg)

if [ ! -e "${files[0]}" ]; then
    echo "❌ Aucun fichier JPG trouvé dans $INPUT_DIR"
    exit 1
fi

# Fusion
convert "${files[@]}" "$OUTPUT"

echo "✅ PDF créé : $OUTPUT"
