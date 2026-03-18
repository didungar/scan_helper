#!/bin/bash

export LANG=en_US.UTF-8

for img in *.jpg; do
  [ -f "$img" ] || continue
  
  filename=$(basename "$img" .jpg)
  
  echo "Processing $img..."

  # nettoyage image
  convert "$img" \
    -resize 300% \
    -colorspace Gray \
    -contrast \
    -sharpen 0x1 \
    -threshold 60% \
    "/tmp/clean_$filename.jpg"

  # OCR
  tesseract "/tmp/clean_$filename.jpg" "$filename" -l fra 2>/dev/null
done

echo "Done."
