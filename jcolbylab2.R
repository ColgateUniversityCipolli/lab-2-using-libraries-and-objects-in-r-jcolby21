library(stringr)

#for first track
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
code.to.process=paste('"',streaming_extractor_music.exe,'"','"',album.track[1],'"','"',desired.output[1],'"', sep="") #returns code to process 

#For all album tracks
matching_subdirs <- list.dirs("Music", recursive = TRUE)

char.count = str_count(matching_subdirs, "/") # Counts the number of "/" in each subdirectory
index.wav = which(char.count == 2) # Returns indexes of wav files
subset.wav = matching_subdirs[index.wav] # Creates a new vector containing only the .wav files

code.to.process = vector() # Creates an empty vector

for(i in 1:length(subset.wav)) {
  file.name = list.files(subset.wav[i]) # Names of files in the current album subdirectory
  album.track = paste(subset.wav[i], file.name, sep = "/") # Combines album directory with the track title
  
  for(j in 1:length(album.track)) {
    # Removing ".wav" from the file names
    album.track.no.wav = str_sub(album.track[j], start = 1, end = nchar(album.track[j]) - 4)
    
    # Splitting the album track name into components
    split.str = str_split(album.track.no.wav, "-")[[1]]
    track.name = split.str[3] # Pulling the track name out
    artist.name = split.str[2] # Pulling the artist name out
    
    split.two = str_split(album.track[j], "/")[[1]]
    album.name = split.two[3] # Pulling the album name out
    
    desired.output = paste(artist.name, album.name, track.name, ".json", sep = "-") # Creating desired output
    
    command = paste('"streaming_extractor_music.exe" "', album.track[j], '" "', desired.output, '"', sep = "")
    code.to.process = c(code.to.process, command) # Adding the command to the vector
  }
}

print(code.to.process)
writeLines(code.to.process, "batfile.txt")
##############################################################################
#Task 2
for (i in 1:length(code.to.process)) {
  split_name <- strsplit(code.to.process[i], "-")[[1]] # Get the first element of the list
  artist = c(artist, split_name[2])  # Access the 2nd element
  album = c(album, split_name[4])    # Access the 4th element
  track = c(track, split_name[5])    # Access the 5th element
}


library(jsonlite)
json_data <- fromJSON("The Front Bottoms-Talon Of The Hawk-Au Revoir (Adios).json")
#could not figure out what to input here so I just continued
str(json_data)


#all the things we wanted to extract
avg_loudness <- json_data$audio_features$loudness
key <- json_data$audio_features$key
energy <- json_data$audio_features$energy
danceability <- json_data$audio_features$danceability
bpm <- json_data$audio_features$tempo
mode <- json_data$audio_features$mode
length_seconds <- json_data$audio_features$duration_ms / 1000

