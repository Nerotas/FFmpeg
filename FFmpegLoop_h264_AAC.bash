#!/bin/bash

# Input and output directories
input_dir="."
output_dir="./temp"

# Create output directory if missing
mkdir -p "$output_dir"

# Loop through all .mp4 files
for file in "$input_dir"/*.mp4; do
  # Skip if no files found
  [ -e "$file" ] || continue

  # Get filename without path
  filename=$(basename "$file")

  # Define output path
  output_file="$output_dir/$filename"

  echo "Processing: $file -> $output_file"

  # FFmpeg command:
  # - Copy video stream
  # - Convert audio to AAC 2 channels
  ffmpeg -i "$file" -c:v libx264 -preset medium -crf 23 -c:a aac -ac 2 "$output_file"
done

echo "All files processed into $output_dir"
