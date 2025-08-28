#!/bin/bash
# convert-to-webp-ffmpeg.sh
# Usage: ./convert-to-webp-ffmpeg.sh inputfile

infile="$1"

if [ -z "$infile" ]; then
  echo "Usage: $0 inputfile"
  exit 1
fi

# Extract basename without extension
basename=$(basename "$infile")
name_noext="${basename%.*}"

# Lowercase the name
lowername=$(echo "$name_noext" | tr '[:upper:]' '[:lower:]')

# Set output file
outfile="${lowername}.webp"

# Convert with scaling to exactly 40x40 pixels
ffmpeg -y -i "$infile" -vf "scale=40:40" "$outfile"

echo "Converted $infile -> $outfile"
