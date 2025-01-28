library(stringr)

subdirs <- list.dirs(recursive = TRUE, full.names = TRUE) #All sub directories in the directories
matching_subdirs <- grep("/Music", subdirs, value = TRUE) #All sub directories containing /Music

char.count=str_count(matching_subdirs, "/") #counts the number of "/" in each subdirectory containg music

index.wav=which(char.count==3)#returns indexes of wav files

subset.wav=matching_subdirs[index.wav]#creates a new vector containing only the .wav files
