library(spotifyr)
library(tidyverse)
library(ggcorrplot)
#library(hrbrthemes)
library(viridis)

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
  '2012' = '59B77qi1KbJQnXLPHQDwXh',
  '2013' = '6qadCZBpEw9BRCKZ4bsJKT',
  '2014' = '1harArs7ZDwRr2YNtUIDj0',
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



# sub_bb[rowSums(is.na(sub_bb)) > 0,] will show us which rows are problematic 
# clean up NA's (only NA's were due to an overall import error for 1993)
sub_bb = sub_bb[rowSums(is.na(sub_bb)) == 0,]

#address some wonky timesig = 0 
sub_bb[(sub_bb$artist=='Pink Floyd' & sub_bb$track.name=='Money - 2011 Remastered Version'),'timesig'] = 7
sub_bb[sub_bb$artist=='Richard Chamberlain','timesig'] = 3
sub_bb[sub_bb$track.name=='Delilah','timesig'] = 3
sub_bb[sub_bb$timesig==1,'timesig'] = 4


# convert key, timesig, & album.type  as factors
sub_bb$key = as.factor(sub_bb$key)
sub_bb$timesig = as.factor(sub_bb$timesig)
sub_bb$album.type = as.factor(sub_bb$album.type)
sub_bb$mode = as.factor(sub_bb$mode)


# create tonal and decade columns:
sub_bb = sub_bb %>% mutate(tonal = case_when(key == 0 ~ 'C', 
                                    key == 1 ~ 'C# / Db', 
                                    key == 2 ~ 'D', 
                                    key == 3 ~ 'D# / Eb', 
                                    key == 4 ~ 'E', 
                                    key == 5 ~ 'F', 
                                    key == 6 ~ 'F# / Gb',
                                    key == 7 ~ 'G', 
                                    key == 8 ~ 'G# / Ab',
                                    key == 9 ~ 'A', 
                                    key == 10 ~ 'A# / Bb', 
                                    key == 11 ~ 'B'))

sub_bb = sub_bb %>% mutate(mode2 = case_when(mode == 0 ~ 'Minor', 
                                    mode == 1 ~ 'Major'))

sub_bb = sub_bb %>% mutate(decade = case_when(year < 1960 ~ 1950, 
                                     year >= 1960 & year < 1970 ~ 1960, 
                                     year >= 1970 & year < 1980 ~ 1970, 
                                     year >= 1980 & year < 1990 ~ 1980, 
                                     year >= 1990 & year < 2000 ~ 1990, 
                                     year >= 2000 & year < 2010 ~ 2000, 
                                     year >= 2010 & year <= 2021 ~ 2010))



# plot of keys: 
k <- sub_bb %>% group_by(tonal) %>% 
  count() %>%
  ggplot(aes(x = reorder(tonal, -n), y = n)) +
  geom_col(fill='#1DB954',  show.legend = FALSE) +
  labs(title = 'Overall Frequency of Keys', x = 'Key', 
         y = 'Count')

# plot of modes (major 1, minor 0)
sub_bb %>% group_by(mode2) %>% count() %>% 
  ggplot(aes(x=mode2, y=n, fill = mode2)) + 
  geom_col(show.legend=FALSE) + 
  labs(title = "Overall Frequency of Modes", x="Mode", y= "Count")


# plot of keys/modes - dodged 
sub_bb %>% group_by(tonal, mode2) %>% 
  count() %>%
  ggplot(aes(x= reorder(tonal, -n), y = n)) +
  geom_col(aes(fill = mode2), position='dodge') +
  labs(title="Frequency of Keys by Mode", x="Key", y='Count') +
  guides(fill=guide_legend(title="Mode"))


#stacked bar graph
sub_bb %>% group_by(tonal, mode2) %>% 
  count() %>%
  ggplot(aes(x= reorder(tonal, -n), y = n)) +
  geom_col(aes(fill = mode2)) +
  labs(title="Frequency of Key & Mode", x="Key", y='Count') +
  guides(fill=guide_legend(title="Mode"))

# modes over time 
sub_bb %>% group_by(year, mode2) %>% count() %>% 
  ggplot(aes(x=year, y=n)) + 
  geom_freqpoly(aes(color=mode2), stat='identity') + 
  geom_smooth(aes(color=mode2)) + 
  labs (title="Mode Frequency Over Time", 
        x= 'Year', y= "Frequency") + 
  guides(fill=guide_legend(title="Mode"))
 
  

# the story of D#/Eb
sub_bb %>% filter(key==3) %>% select(track.name, artist, year) %>% 
  group_by(year) %>% count() 


# by timesig
t <- sub_bb %>% group_by(timesig) %>% count() %>% 
  ggplot(aes(x = reorder(timesig, -n), y = n)) +
  geom_col(aes(fill = timesig), show.legend = FALSE) + 
  labs(title="Frequency of Time Signature", 
       x= "Time Signature", 
       y= "Count")
# the fabulous case of Pink Floyd "Money" = 7/4
# this data is hella bad 




# correlation plot (between numeric factors)

num_features = c("danceability", "energy", "loudness", "speechiness", "acousticness" , "instrumentalness", 
                 "liveness" , "valence" , "tempo" , "duration")

num_bb = sub_bb[, num_features]

cors = cor(num_bb)
ggcorrplot(cors, hc.order = TRUE, type = "lower",
           outline.col = "white") + labs(title="Correlation of Numeric Metrics")


# only real correlations: 

# energy vs loudness 
sub_bb %>% ggplot(aes(x=loudness, y=energy)) + 
  geom_point() 


# dancability vs valence 
sub_bb %>% ggplot(aes(x=valence, y=danceability)) + 
  geom_point()


# tempo density
bpm_dist <- 
sub_bb %>% ggplot(aes(x=tempo)) + geom_density() + 
  geom_vline(xintercept=122, size=0.75, color="red", 
             linetype = "dashed") + 
  geom_vline(xintercept=98, size=0.75, color="red", 
             linetype = "dashed") + 
  labs(title="Tempo Distribution", x= "Tempo (bpm)", y="Density")

# tempo affects danceability 
sub_bb %>% ggplot(aes(x=tempo, y=danceability)) + 
  geom_bin2d(bins=30) +
  theme_bw() + labs(title = 'Danceability vs. Tempo', 
                    x="Tempo (bpm)", y = "Danceability [0,1]")

# Overall danceability: 
mean(sub_bb$danceability) # 0.621
sd(sub_bb$danceability) #0.15
# conf int. (0.321, 0.921)
 

#overall danceability 
sub_bb %>% ggplot(aes(x=danceability)) + geom_density() + 
  labs(title = "Overall Danceabilty Distribution", 
       x = "Danceabilility [0,1]", y="Density")


sub_bb %>% ggplot(aes(x=danceability, y=valence)) + 
  geom_bin2d(bins=30) +
  theme_bw() + labs(title = 'Danceability vs. Valence', 
                    x="Valence [0,1]", y = "Danceability [0,1]")

sub_bb %>% ggplot(aes(x=tempo, y=valence)) + 
  geom_bin2d(bins=30) +
  theme_bw() + labs(title = 'Valence vs. Tempo', 
                    x="Tempo (bpm)", y = "Valence [0,1]")



# duration density 
dur_dist <- 
  sub_bb %>% ggplot(aes(x=duration)) + geom_density() + 
  geom_vline(xintercept=230000, size=0.75, color="red", 
             linetype = "dashed")+ 
  labs(title = "Distribution of Song Lengths", 
       x= "Duration (ms)", y = "Density")
# add line at peak - ideal length of time (230000 ms ~ 3m50s)


# overall density plots for all numeric factors
sub_bb %>% ggplot(aes(x=valence)) + geom_density()
sub_bb %>% ggplot(aes(x=energy)) + geom_density()
sub_bb %>% ggplot(aes(x=loudness)) + geom_density()


sub_bb %>% ggplot(aes(x=acousticness)) + geom_density()





# key popularity over time: 
  
sub_bb %>% group_by(year, tonal) %>% count() %>% 
  ggplot(aes(x=year, y=n)) + 
  geom_freqpoly(aes(color=tonal), stat='identity', show.legend = FALSE) + 
  facet_wrap(~tonal) + 
  geom_smooth(aes(color=tonal)) + 
  labs(title="Key Popularity Over Time", 
        x= 'Year', y= "Frequency") + 
  guides(fill=guide_legend(title="Mode"))


# key/mode popularity over time

sub_bb %>% group_by(year, tonal, mode2) %>% count() %>% 
  ggplot(aes(x=year, y=n)) + 
  geom_freqpoly(aes(color=mode2), stat='identity') + 
  facet_wrap(~tonal) + 
  geom_smooth(aes(color=mode2)) + 
  labs (title="Key/Mode Popularity Over Time", 
        x= 'Year', y= "Frequency") + 
  guides(fill=guide_legend(title="Mode"))






# pop songs are getting sadder

#overall valence 
sub_bb %>% ggplot(aes(x=valence)) + geom_density() + 
  labs(title = "Valence Distribution", x = 'Valence', y='Density' ) 

# while tempo and danceability remained fairly constant over the years
# the same cannot be said for valence 
sub_bb %>% filter(decade != 1950) %>% ggplot(aes(x=valence)) + 
  geom_density() + facet_wrap(~decade) + 
  labs(title="Valence Distribution by Decade", 
       x= 'Valence', y="Density")

# valence by year 
sub_bb %>% group_by(year) %>% summarize(avg_v= mean(valence)) %>%
  ggplot(aes(x=year, y= avg_v)) + geom_freqpoly(stat='identity') + 
  labs(title = "Average Valence by Year", x = "Year", y="Average Valence")


# wait, but are popsongs in minor keys really sadder? 
# average valence by mode: 
sub_bb %>% group_by(mode2) %>% 
  ggplot(aes(x=mode2, y= valence, fill = mode2)) + 
  geom_boxplot(show.legend=FALSE) + 
  labs(title="Valence by Mode", x = "Mode", y = "Valence")

t.test(sub_bb$valence ~ sub_bb$mode2)
#p-value = 9.459e-05
#NO!!!! They aren't sadder, they aren't even equivalent
# they are happier? 

# f test
var.test(sub_bb$valence ~ sub_bb$mode2, alternative = "two.sided")
# the variances aren't equal... so our t test isn't really valid 
# p-value = 0.01133

# ok so they aren't necessarily happier...
# but pop music certainly seems to be challenging convention









#  is acousticness poised for a comeback? 
sub_bb %>%  ggplot(aes(x=acousticness)) + 
  geom_density() + labs(title = "Acousticness Distribution", 
                        x="Acousticness", 
                        y="Density")

# not that prominant in pop, but that wasn't always the case

sub_bb %>% filter(decade != 1950) %>% ggplot(aes(x=acousticness)) + 
  geom_density() + facet_wrap(~decade) + 
  labs(title="Acousticness by Decade", 
       x= 'Acousticness', y="Density")

# poised for a comeback? 
sub_bb %>% group_by(year) %>% 
  summarize(avg_v= mean(acousticness)) %>%
  ggplot(aes(x=year, y= avg_v)) + 
  geom_freqpoly(stat='identity') + 
  labs(title= "Average Acousticness Over Time", x = "Year", 
       y = "Average Acousticness")





# what about speechiness? 
sub_bb %>%  ggplot(aes(x=speechiness)) + 
  geom_density() + labs(title = "Speechiness Distribution", 
                        x="Speechiness", 
                        y="Density")

# historically not that prominent in pop music, but there is some shift
sub_bb %>% filter(decade != 1950) %>% ggplot(aes(x=speechiness)) + 
  geom_density() + facet_wrap(~decade) + 
  labs(title="Speechiness by Decade", 
       x= 'Speechiness', y="Density")

# as hip hop and rap blend more and more into pop we can see a rise
sub_bb %>% group_by(year) %>% 
  summarize(avg_v= mean(speechiness)) %>%
  ggplot(aes(x=year, y= avg_v)) + 
  geom_freqpoly(stat='identity') + 
  labs(title= "Average Speechiness Over Time", x = "Year", 
       y = "Average Speechiness")


sub_bb %>% group_by(year) %>% filter(speechiness> mean(speechiness)) %>% 
  count() %>% arrange(desc(n))







