#!/bin/bash
for f in *.mkv; do ffmpeg -i "$f" -c:v libx264 -preset veryfast -c:a copy -sn -y "${f%.mkv}_transcoded.mp4"; done
