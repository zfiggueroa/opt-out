## DESCRIPTION
Downloads the latest videos from your favorite TikTok and Youtube channels, keep track of new videos and store them for offline view.

## USAGE
Save your favorite channels inside `tt.users` and `yt.users` then execute `sh opt-out.sh` wth one of the following options:
```
tt = tiktok only videos
yt = youtube only videos
hs = repopulate yt.history
```` 
example:

`$ sh opt-out.sh yt`

## DEPENDENCIES
* yt-dlp
* ffmpeg

## PROFILE
if you want to run is as command add the following line inside your sh profile:

~/.bash_profile

`alias opt-out="/path/to/opt-out.sh"`

Now you can run it from any terminal:

`$ opt-out yt`

## BUGS
currently `yt-dlp` sometimes fails downloading tiktok channels metadata so you have to run again `opt-out tt`
