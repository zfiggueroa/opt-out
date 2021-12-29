## DESCRIPTION
Downloads the latest videos from your favorite TikTok and Youtube channels, keep track of new videos and store them for offline view.

## USAGE
Save your favorite channels inside `tt.users` and `yt.users` then execute `sh opt-out.sh` wth one of the following options:
```
tt = tiktok only videos
yt = youtube only videos
hs = repopulate yt.history
```` 
Example:

`$ sh opt-out.sh yt`

## DEPENDENCIES
* yt-dlp
* ffmpeg

## PROFILE
If you want to run it as command add an `alias` inside your sh profile.

`alias opt-out="/path/to/opt-out.sh"`

Now you can run it from terminal.

`$ opt-out yt`
## BUGS
Currently `yt-dlp` sometimes fails downloading tiktok users metadata so you have to run again `opt-out tt` if a channel fails to download.
