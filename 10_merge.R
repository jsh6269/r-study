producers <- data.frame(   
  surname =  c("Spielberg","Scorsese","Hitchcock","Tarantino","Polanski", "Lucas"),
  nationality = c("US","US","UK","US","Poland", "US"),
  stringsAsFactors=FALSE
)

movies <- data.frame(    
  name = c(
    "Spielberg",
    "Scorsese",
    "Hitchcock",
    "Hitchcock",
    "Spielberg",
    "Tarantino",
    "Polanski"
  ),    
  title = c(
    "Super 8",
    "Taxi Driver",
    "Psycho",
    "North by Northwest",
    "Catch Me If You Can",
    "Reservoir Dogs","Chinatown"
  ),                
  stringsAsFactors=FALSE
)

# full match
m1 <- merge(producers, movies, by.x="surname", by.y="name"); m1
dim(m1)

# partial merge
m2 <- merge(producers, movies, by.x="surname", by.y="name", all.x=TRUE); m2
dim(m2)
