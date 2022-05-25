## DESCRIPTION
Downloads the latest videos from your favorite streaming services using yt-dlp extractors, keep track of new videos and store them for offline view.
<img src="https://i.ibb.co/G2gWXzs/Screenshot-2022-01-21-19-54-16.png" width=70% height=70%>
<img src="https://i.ibb.co/G2gWXzs/Screenshot-2022-01-21-19-54-16.png" width=70% height=70%>
<img src="https://i.ibb.co/G2gWXzs/Screenshot-2022-01-21-19-54-16.png" width=70% height=70%>
Full extractors list https://github.com/yt-dlp/yt-dlp/tree/master/yt_dlp/extractor

## USAGE
Syntax:

`$ opt-out.sh <list> <n>`

```
<list> users/channels list to scan for videos
<n> download latest 'n' videos
```` 
Example:

`$ opt-out.sh yt.users 30`

This will download the latest 30 videos using `yt.users` as `<list>`.

## DEPENDENCIES
* yt-dlp
* ffmpeg

## PROFILE
If you want to run it as command add an `alias` inside your shell profile.

`alias opt-out="/path/to/opt-out.sh"`

Now you can run it from any path on terminal.

`$ opt-out tt.users 10`
