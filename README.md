# R-Spotify-Project
Examining popular song characteristics



Background:  


Pop music is less of a specific genre and more just a label indicating membership to the collection of subgenres that a large portion of the population finds appealing at a given point in time- after all,  "Pop" is simply short for "Popular". And what is considered popular is constantly shifting. 

It is no mystery that the characteristics of Pop Music have shifted over the years.  Subgenres such as Folk, Rock, Heavy Metal, R&B, Hip Hop, and Country have ebbed and flowed in collective popularity over time and so too has their overlap with general Pop Music. 
While several studies have been conducted in attempt to characterize specific genres by musical metrics (to very little success), some general trends in these metrics may be identified in the shifting collective preference over the years. 

How has pop music changed over the years? Can we identify which metrics specifically have changed? And where could it be heading now? 


The Data: 

Using the Spotify Web API and the R Spotifyr packages, I extracted the track information and metrics for the Top 100 Billboard songs from every year between 1955 and 2021.  A few tracks from years 1993, 2012, and 2014 had issues getting the complete data through the API, but the majority of years exported completely with no issues. 

The columns of Popularity and Genre were disregarded in this study for the following reasons: 
- Popularity (integer between 0 to 100, with 100 being the most popular) is the current popularity of the ARTIST not the individual song.  The score is based heavily on current listening numbers (therefore skewed in favor of more recent artists/tracks) and is thus inapplicable for comparison in our overall study of the past 65 years. 
- Genre returns a list of all subgenres (of 1371 possible subgenres) under which an artist may be catagorized with no ranking.
 For the sake of this study, we are treating all music as 'Pop' and will exam how the composition of the 'Pop' genre has changed as collective preferences have shifted over the years. 



Presentation Slides: 

https://docs.google.com/presentation/d/16ZK7P8EHFMhrU10jTk2l148S7qyaNGlMEK9yzakdjFo/edit#slide=id.gc6f980f91_0_10