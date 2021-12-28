#!/bin/bash
printf "\033c\033]2;opt-out\a"
#setterm -cursor off

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
video_path=("$SCRIPT_DIR")

# mapfile
mapfile -t youtube	< "$video_path/data/yt.users"
mapfile -t tiktok	< "$video_path/data/tt.users"

# options
loging=" -ciw --playlist-end 5 --dateafter now-2days --mark-watched --download-archive"
secure=" --no-warnings --no-part --no-cache-dir --no-call-home -4 --geo-bypass --geo-bypass-country NL --restrict-filenames"

# re-populate yt history
if [[ $1 = "hs" ]]; then
	dd if=/dev/null of="$video_path/data/yt.history"; clear
	for i in "${youtube[@]}"; do yt-dlp -f wa $i --playlist-end 5 --mark-watched --download-archive "$video_path/data/yt.history"\
	--output "$video_path/null"; clear; done; rm "$video_path/null"; exit
else break 2>/dev/null; fi

# tiktok
if [[ $1 = "tt" ]]; then
	for i in "${tiktok[@]}"; do
	yt-dlp -f b $i --output "$video_path/downloaded-video/TikTok/%(id)s.%(ext)s"\
	$loging "$video_path/data/tt.history" $secure; clear; done; exit
else break 2>/dev/null; fi

# youtube
if [[ $1 = "yt" ]]; then
for i in "${youtube[@]}"; do
	yt-dlp -f 'bv*[height<=480]+ba/b[height<=480] / wv*+ba/w' $i --output "$video_path/downloaded-video/%(uploader)s/[%(upload_date)s] %(title)s.%(ext)s"\
	$loging "$video_path/data/yt.history" $secure --match-filter '!is_live' --youtube-skip-dash-manifest; clear; done; exit
else break 2>/dev/null; fi

if [[ $1 != "hs" ]] || [[ $1 != "tt" ]] || [[ $1 != "yt" ]]; then printf "\ninvalid argument option\n\n"; fi
