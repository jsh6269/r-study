y1 <- c(12, 22, 31, 54)
y2 <- c('cat', 'dog', 'swim', 'pool')
y3 <- c(TRUE, TRUE, FALSE, TRUE)
y4 <- c(2.4, 3.2, 1.5, 2)
df <- data.frame(y1, y2, y3, y4)
df

names(df) <- c('ID', 'name', 'presence', 'price')
df

str(df)

df2 <- data.frame(y2, y3, stringsAsFactors=TRUE)
str(df2)

df[2:3, 1:3]

df$quantity <- c(1, 2, 1, 3); df
df[nrow(df)+1, ] <- c(12, "party", TRUE, 2.2, 5); df

df <- cbind(df, gender=c("female", "male", "none", "none", "none")); df
df <- rbind(df, c(2, "earth", TRUE, 999, 1, "none")); df

df$gender
subset(df, subset = price >= 2 & gender == "none")
