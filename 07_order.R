# install.packages("dplyr")
library(dplyr)
set.seed(42)

data_frame <- tibble(
  c1 = rnorm(3000, 10, 1.5),
  c2 = rnorm(3000, 10, 1.5),
  c3 = rnorm(3000, 10, 1.5)
)

# c1 ascending
df <- data_frame[order(data_frame$c1), ]
head(df)

# c1 descending, c3 ascending
data_frame[order(-data_frame$c1, data_frame$c3), ]
