library(stringr)

matching_subdirs <- list.dirs("Music", recursive = TRUE) #All sub directories in the directories

char.count=str_count(matching_subdirs, "/") #counts the number of "/" in each subdirectory containg music

index.wav=which(char.count==2)#returns indexes of wav files

subset.wav=matching_subdirs[index.wav]#creates a new vector containing only the .wav files

code.to.process=vector()#creates an empty vector

file.name=list.files(subset.wav[1])#names of files located within each album subdirectory
album.track=paste(subset.wav[1],file.name[1], sep ="/") #combines the album directory and the current track title
album.track.no.wav=str_sub(album.track[1], start=1, end=length(album.track[1])-6)#removes the .wav at the end of the file
split.str=str_split(album.track.no.wav[1],"-") #splits the album track with no wav to a vector
track.name=split.str[[1]][3]#pulls the track name out
artist.name=split.str[[1]][2]#pulls the artist name out
split.two=str_split(album.track[1],"/") #splits album track with wav at the "/" symbol
album.name=split.two[[1]][3]#pulls the album name out
desired.output=paste(artist.name[1],album.name[1],track.name[1],".json",sep="-")#creates the desired output
code.to.process=paste("streaming_extractor_music.exe", album.track[1], desired.output[1]) #returns code to process 