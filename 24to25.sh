#!/bin/bash -x 


 ffmpeg -i "$1" -r 25 -filter:v "setpts=0.96*PTS" -c:v prores -an "$1"_silent.mov
 ffmpeg -i "$1" -filter:a "atempo=25/24" -vn "$1"_audio.wav
 ffmpeg -i "$1"_silent.mov -i "$1"_audio.wav -c copy "$1"_retimedtopal.mov