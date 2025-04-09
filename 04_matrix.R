# matrix(data, nrow, ncol, byrow=FALSE)
matrix(1:10, nrow=5)
x <- matrix(1:10, nrow=5, byrow=TRUE); x
dim(x)

a <- 1:6
dim(a) <- c(2, 3); a
nrow(a)
ncol(a)

# add row and col
y <- matrix(c(2, 5, 3, 2, 1, 4, 1, 7), nrow=4, byrow=TRUE); y
y <- cbind(y, 1:4); y
y <- rbind(y, 1:3); y
y <- cbind(y, y); y
y <- rbind(y, y); y

# slicing
y <- y[1:5, 1:3]; y

# name row and column
rownames(y) <- c("row1", "row2", "row3", "row4", "row5")
colnames(y) <- c("col1", "col2", "col3")
y

# indexing
y[2, 2] # row2 & col2
y[4,] # row4
y[,3] # col3
