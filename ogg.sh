#!/bin/bash

for a in ./*.flac; do
  < /dev/null ffmpeg -i "$a" -qscale:a 6 "${a[@]/%flac/ogg}"
done