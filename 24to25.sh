#!/bin/bash -x 

ffmpeg -i "$1" -r 25 -filter_complex "[0:v]setpts=24/25*PTS[v]; [0:a]atempo=25/24[a]" -map "[v]" -map "[a]" "$1"_redimedtopal.mov
