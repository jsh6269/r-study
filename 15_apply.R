mat <- matrix(1:15, nrow=3)
mat

# 행단위
a <- apply(mat, 1, mean); a

# 열단위
a <- apply(mat, 2, sum); a

# list apply
stat <- lapply(c("STR", "DEX", "INT", "LUK"), tolower)
str(stat)

# list to vec
stat_vec <- unlist(stat)
str(stat_vec)

# vector apply
mod <- function(x) {
  paste0(tolower(x), "!")
}
stat <- sapply(c("STR", "DEX", "INT", "LUK"), mod)
stat

# example
below_ave <- function(x) {
  ave <- mean(x)
  return(x[x > ave])
}
dt_s<- sapply(cars, below_ave)
dt_s

# table/tagged apply
scores <- c(80, 90, 75, 60, 95, 88)
groups <- c("A", "A", "B", "B", "A", "B")

tapply(scores, groups, mean)
tapply(iris$Sepal.Width, iris$Species, median)
