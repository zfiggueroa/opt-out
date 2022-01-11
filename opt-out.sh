#!/bin/bash
printf "\033c\033]2;opt-out\a"
setterm -cursor off

video_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# mapfile
mapfile -t youtube	< "$video_path/yt.users"
mapfile -t tiktok	< "$video_path/tt.users"

# options
loging=" -ciw --playlist-end 10 --dateafter now-2days --mark-watched --download-archive"
secure=" --no-warnings --no-part --no-cache-dir --no-call-home -4 --geo-bypass --geo-bypass-country NL --restrict-filenames"

# re-build yt history
if [[ $1 = "hs" ]]; then
dd if=/dev/null of="$video_path/yt.history"; clear
	for i in "${youtube[@]}"; do
	yt-dlp -f wa $i $secure $loging "$video_path/yt.history" --output "$video_path/.null"; clear; done; rm "$video_path/.null"; exit
break; fi

# tiktok
if [[ $1 = "tt" ]]; then
	for i in "${tiktok[@]}"; do
	yt-dlp -f b $i $secure $loging "$video_path/tt.history" --output "$video_path/downloaded-videos/TikTok/%(id)s.%(ext)s"; clear; done; exit
break; fi

# youtube
if [[ $1 = "yt" ]]; then
for i in "${youtube[@]}"; do
	yt-dlp -f 'bv*[height<=480]+ba/b[height<=480] / wv*+ba/w' $i $secure $loging "$video_path/yt.history" --match-filter '!is_live'\
	--output "$video_path/downloaded-videos/%(uploader)s/[%(upload_date)s] %(title)s.%(ext)s"; clear; done; exit
break; fi

# verify arguments
if [[ $1 != "hs" || $1 != "tt" || $1 != "yt" ]]; then printf "\ninvalid argument option\n\n"; fi
