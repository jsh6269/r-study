vect <- 1:5
mat <- matrix(1:10, ncol=5)
df <- EuStockMarkets[1:10, ]
my_list <- list(vect, mat, df); my_list

my_list[[2]]  # mat itself
my_list[2]  # list (contains mat)
