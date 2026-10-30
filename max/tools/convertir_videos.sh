#!/bin/sh
# Convierte los videos de max/bobGrid/ a HAP (los descomprime la tarjeta de
# video, casi sin CPU) y les quita el audio. Los originales se quedan junto a
# los nuevos. Se corre donde haya ffmpeg (no en la Mac mini); los .mov que
# genera se suben al repo.
#
#   sh max/tools/convertir_videos.sh
#
# - Donitas*.mp4 → Donitas*-hap.mov, a 30 fps.
# - *BobVideo.mov son UN solo cuadro (una foto): → *Bob-hap.mov, la misma
#   imagen 2 s a 5 fps, así Max solo descomprime 5 veces por segundo.
set -e
cd "$(dirname "$0")/../bobGrid"
HAP="-an -c:v hap -format hap -compressor snappy -pix_fmt rgba"

for n in 1 3 5; do
  ffmpeg -v error -y -i "Donitas$n.mp4" -vf fps=30 $HAP "Donitas$n-hap.mov"
done
for c in green yellow red; do
  ffmpeg -v error -y -stream_loop -1 -i "${c}BobVideo.mov" -vf fps=5 -t 2 $HAP "${c}Bob-hap.mov"
done
ls -l *-hap.mov
