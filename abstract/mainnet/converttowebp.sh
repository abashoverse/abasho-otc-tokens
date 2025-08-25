#!/bin/bash
# convert-to-webp-ffmpeg.sh
# Usage: ./convert-to-webp-ffmpeg.sh inputfile outputfile.webp

infile="$1"
outfile="$2"

if [ -z "$infile" ] || [ -z "$outfile" ]; then
  echo "Usage: $0 inputfile outputfile.webp"
  exit 1
fi

# Convert with scaling to exactly 40x40 pixels
ffmpeg -y -i "$infile" -vf "scale=40:40" "$outfile"
