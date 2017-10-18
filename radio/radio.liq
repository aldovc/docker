#!/usr/bin/liquidsoap
# Log dir
set("log.file.path", "/var/log/liquidsoap")

# Music
myplaylist = playlist("/var/playlists/music.m3u")

# Jingles
jingles = playlist("/var/playlists/jingles.m3u")

# If something goes wrong, we'll play this
security = single("/var/singles/default.mp3")


# Start building the feed with music
radio = myplaylist
# Now add some jingles
radio = random(weights = [1, 4], [jingles, radio])
# And finally the security
radio = fallback(track_sensitive = false, [radio, security])

# Stream it out
output.icecast(%vorbis.cbr(samplerate=44100, channels=2, bitrate=320),
    host = "icecast",
    port = 8000,
    password = "hackme",
    mount = "radio.ogg",
    name = "Radio",
    description = "Music 24/7",
    radio)
