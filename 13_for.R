sum <- 0
for(i in 1:100){
  sum <- sum + i
}
sum

list <- c()
for(i in seq(2, 10, by=2)){
  list[i/2] <- i ^ 2
}
list

for(fruit in c("apple", "bananna", "pineapple")){
  cat(paste("I love", fruit, "\n"))
}

mat <- matrix(data = 10:21, nrow = 6, ncol =2)
for (r in 1:nrow(mat))
  for (c in 1:ncol(mat))
    print(paste("Row", r, "and column",c, "have values of", mat[r,c]))
