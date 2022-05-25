#!/bin/bash

# PWD
PWD=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# MAPPING
mapfile -t users < "$PWD/$1"

# OPTIONS
read -r -d '' ARG <<- EOM
	--force-overwrites
	--geo-bypass
	--geo-bypass-country NL -4
	--mark-watched
	--match-filter !is_live
	--match-filter "duration<?3600"
	--no-cache-dir
	--no-part
	--no-mtime
	--no-sponsorblock
	--no-warnings
	--playlist-end $2
	--prefer-free-formats
	--restrict-filenames
EOM

# EXTRACTOR
for i in "${users[@]}"; do
	yt-dlp -f 'bv*[height<=480]+ba/b[height<=1080] / wv*+ba/w' $i $ARG --download-archive "$PWD/.$1.hs"\
	--output "$PWD/%(extractor)s/%(uploader)s/[%(upload_date)s] %(title)s.%(ext)s"; clear
done
