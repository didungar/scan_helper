#!/bin/bash

TARGET_DIR="./"
cd "$TARGET_DIR" || exit

for file in *.jpg; do
    # On extrait le numéro entre parenthèses 
    if [[ $file =~ \(([0-9]+)\) ]]; then
        num="${BASH_REMATCH[1]}"
        
        # On formate le numéro sur 3 chiffres (ex: 5 -> 005)
        new_name=$(printf "image_%03d.jpg" "$num")

        # Renommage direct 
        if [ "$file" != "$new_name" ]; then
            mv "$file" "$new_name"
            echo "Renommé : $file -> $new_name"
        fi
    fi
done
