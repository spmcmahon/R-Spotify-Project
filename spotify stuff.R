library(spotifyr)
library(tidyverse)

source('secrets.R')

access_token <- get_spotify_access_token()

# LOADING FUNCTIONS:

# list/dictionary of hrefs for 1955 - 2021



playlists = list(
  '1955' = '5Dx8NDzwu00zsOIt0vVkQ9', 
  '1956' = '47cq8xUO84TziuXwdogiZ4', 
  '1957' = '4H6T3SOex4GJCSDuUIaAO6', 
  '1958' = '7iOZS0hhVQ36NmDi96UJY5', 
  '1959' = '14agTf2eM5eQbuDnEHfUyw' 
)

playlists60 = list(
  '1960' = '3G4HXHBA07kT05SrkjF9gC',
  '1961' = '7kTSKurwPKNOdseenwpnnL',
  '1962' = '2aYXRqQ94EGQAv5VkkVgsS',
  '1963' = '0Njl7iGQkbaveX8Nwnl6SY',
  '1964' = '4vmncHjirT0v0GyrONw26x',
  '1965' = '3hSRTB18CL0rySmHQZOTd9',
  '1966' = '1bqw3aB9lfWna30GlQGjmj',
  '1967' = '3YvggAfkmZQpGsezqa1LBa',
  '1968' = '3o515kLz17OpAJL6kt3H8b',
  '1969' = '2vHeQwkSZ82aOxmsDMKJ1D'
)

playlists70 = list(
  '1970' = '5OcjS3AcrXGm0DRVOgHPgo',
  '1971' = '48Au8pYHrreyniidv9AX4X',
  '1972' = '7CIeE38SdXZ9J0M76QRhmS',
  '1973' = '4YqVByjHGu3grG3CZa1VKh',
  '1974' = '0ycWLvwxtT5LIfZXFBpNaY',
  '1975' = '0gbg9URi8NekuofjdERwa7',
  '1976' = '6StoAH35GDVgMzNldxnZTA',
  '1977' = '4o5cek3OBzJGYfnCBDpf6f',
  '1978' = '3mt2ysylQQ2cccDPyGfKID',
  '1979' = '6bHjBCFN8Lqj0K54RWFci8'
)
  
playlists80 = list(
  '1980' = '7DCh6mOvaEGMVph25k7hyN',
  '1981' = '5wbHH4DqF4AVuGmjXI8kcW',
  '1982' = '1bk6tO6d5oes6n0vhACi5x',
  '1983' = '7GN1ulgzXBWpn5VADARkNd',
  '1984' = '1PGfIx39B5FnyHa1B9zEST',
  '1985' = '7fGtXiE8qbQzqEisHw5CLS',
  '1986' = '4rhgAIno9OiopUzNhOZDbc',
  '1987' = '3fniVM8pbMq8jcR23aVIY8',
  '1988' = '1LCUqaG3ZbFnpJweV1lrj1',
  '1989' = '6taan6n01bwB2B7EtN9KYI'
)
  
playlists90 = list(
  '1990' = '2mI2QBJDL4klpigMkqaFs5',
  '1991' = '61FusglQju0yXpz3v7nYd5',
  '1992' = '0p6VwHqAZNV9xw5HuIKHJd',
  '1993' = '35wZqszdyXNFCAztyLWlgT',
  '1994' = '7A1EbS3Zux6zhXyeSpHEx9',
  '1995' = '5zYgmmRp9ozLstVry1JLbw',
  '1996' = '0YKbjLgCPsp7K3k2JH4NZw',
  '1997' = '6NewzRggzRDBBPowRuXBor',
  '1998' = '6RSRHtcA8MRpATzsi4XolB',
  '1999' = '2A8UXSOAFLAFdZ4fdOrwJC'
)

playlists00 = list(
  '2000' = '6sBduygGNeCecOenI9ZZ2F',
  '2001' = '3aC9OQXALT39AwIsDt1FoE',
  '2002' = '4PKrJacjOzTGAs2X85Lk7q',
  '2003' = '3ZE5YJUjimJ6avd5qqyNog',
  '2004' = '1FtOhbe9MmxVq3yhU9AYzP',
  '2005' = '0zkjY0lqe24t46NYqR4227',
  '2006' = '1DJUcPQ4PwaiTsXPE0KfGg',
  '2007' = '3wU8xj1bC7JSG7aNKjeWAo',
  '2008' = '4eYNvmehJoJls9qaMtRzSA',
  '2009' = '1MMdvZO8NSzJkrGaQwOqdd'
)
  
playlists1020 = list(
  '2010' = '0yF6JCWDdrOa4HHiMqyPtO',
  '2011' = '7G6kv2oTKqa22dRe7wtYSL',
  '2012' = '2Inm8T8QcA90nbOGshxHLo',
  '2013' = '6qadCZBpEw9BRCKZ4bsJKT',
  '2014' = '5ohzMZ3OBvDlHypXCBKrHa',
  '2015' = '5PQypC2evM3DNjdGiHyuCQ',
  '2016' = '6BNqBWGaFvXpgIHgf6kgHF',
  '2017' = '1Pi3PakFUqghiLcASsYJpZ',
  '2018' = '6C8GBgqiWIzKCzCQBc2CSQ',
  '2019' = '6sxay2eKIKLxHCuytNSohv',
  '2020' = '1GIJsNcI4aLIm0ftqRFZVu',
  '2021' = '1bjAgktyYGqKJXynU4H8SO'
)


# build get_info function to take in playlist id's 
# extract tracks from playlist (df out)
# extract audio features from tracks (df out)
# merge two dfs together
# mutate to add playlist year 
# extract artist name from embedded list href and save to new artist column
# export data as csv for each year


get_info = function(slst){
  plist_year = names(slst)
  plist_id = slst[[plist_year]][1]
  tracks = get_playlist_tracks(plist_id)
  features = get_track_audio_features(tracks[,16])
  combo = tracks %>%
    right_join(features, by=c("track.id" = "id"))
  combo = combo %>% mutate(year = plist_year)
  filename = paste0('data/bb', plist_year, '.csv')
  
  for (i in 1:nrow(combo)){
    combo[i, 'artist'] = toString(combo$track.artists[[i]][3]$name)
  }
  
  write_csv(combo, filename)
  
}

# repeat this for every decade - not all at once (Spotify doesn't like that)

for (i in 1:length(playlists1020)){
  get_info(playlists1020[i])
  
}


# CREATE MEGA DATAFRAME

# read in all csvs then rbind all together into a mega dataframe 

dummy_df = read.csv('bb1955.csv')
cols = colnames(dummy_df)

setwd('data')
files = list.files(pattern="*.csv")
# First apply read.csv, then rbind
handle_each <- function(x){
  temp <- read.csv(x, header = TRUE,  col.names = cols)
  return(temp)
}
mega_df = do.call(rbind, lapply(files, handle_each))

#let's keep a csv file with EVERYTHING in it before we start to filter
write.csv(mega_df, 'megabb.csv')



# FILTERING & CLEANING:


# select columns of interest: 

keep_col_nums = c(14, 16, 18, 19, 22, 25, 31, 32, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 56, 57, 58, 59)

sub_bb = mega_df[,keep_col_nums]

# rename columns 

sub_bb = sub_bb %>% rename(album.type = track.album.album_type,
                  explicit = track.explicit, 
                  track.number = track.track_number,
                  popularity = track.popularity,
                  album.name = track.album.name,
                  release.date = track.album.release_date, 
                  timesig = time_signature, 
                  duration = duration_ms)


# clean up NA's

# sub_bb[rowSums(is.na(sub_bb)) > 0,] will show us which rows are problematic 


# convert key, timesig, & album.type  as factors
#sub_bb$key = as.factor(sub_bb$key)
#sub_bb$timesig = as.factor(sub_bb$timesig)
#sub_bb$album.type = as.factor(sub_bb$album.type)


# release date to datetime ($ year? or year as factor?)












            
