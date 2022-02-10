library(spotifyr)
library(tidyverse)

source('secrets.R')

access_token <- get_spotify_access_token()

# general flow: get playlist tracks, send up to gtaf (not too many at a time)
# merge with tracks, select relevant columns 



tracks <- get_playlist_tracks('0cmYhJlOfkWk2WXxb9Oi4g')
features <- get_track_audio_features(tracks[1:10,16]) 
# column 16 is the track.id needed

tracks2 <- tracks %>%
  right_join(features, by=c("track.id" = "id"))
# can also merge on track.uri = uri


# select columns of interest: c(9, 14, 18, 19, 21, 31, 32, 41:51, 56, 57)

# convert duration_ms to seconds, or minutes 

# release date: month and year (month = 0 if NA)

# extract artist name from "track.artists" 
#num = row number
artists = tracks2[num, 'track.artists'][[1]][3]$name





            