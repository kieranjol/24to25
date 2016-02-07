#!/bin/bash -x 


 ffmpeg -i "$1" -r 25 -filter:v "setpts=0.96*PTS" -c:v prores -an "$1"_silent.mov
 ffmpeg -i "$1" -filter:a "atempo=25/24" -vn "$1"_audio.wav
 ffmpeg -i "$1"_silent.mov -i "$1"_audio.wav -c copy "$1"_retimedtopal.mov

# ffmpeg -i "$1" -r 25 -filter_complex "[0:v]setpts=24/25*PTS[v]; [0:a]atempo=25/24[a]" -map "[v]" -map "[a]" "$1"_redimedtopal.mov
