adder <- function(x, y) {
  print("Hi there")
  x + y
}
ans <- adder(2, 4)
ans

x <- c(3, 5, 9, 10, 13, 2)

# 간격 1
diff(x)

# 간격 2
diff(x, lag=2)

# 변화의 변화
diff(x, differences=2)

# can be applied to vector
abs(-3)
log(81, base=3)
exp(4)
sqrt(c(4, 9, 16, 2))
factorial(10)

sample <- c(1, 2, 3, 1, 4, 2)
mean(sample)
median(sample)
var(sample)
sd(sample)
scale(sample)
quantile(sample)
summary(sample)
