#!/bin/bash

export LANG=en_US.UTF-8

for img in *.jpg; do
  [ -f "$img" ] || continue
  
  filename=$(basename "$img" .jpg)
  
  echo "Processing $img..."
  
  tesseract "$img" "$filename" -l fra 2>/dev/null
done

echo "Done."
