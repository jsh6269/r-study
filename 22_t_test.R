set.seed(42)

# 30 samples
weights <- rnorm(30, mean = 9.99, sd = 0.04)
head(weights)

# H0: mean is 10
# H1: mean is not 10
t.test(weights, mu = 10)

# H0: mean before = mean after
# H1: mean before != mean after
before <- rnorm(7, mean=50000, sd=50)
after <- rnorm(7, mean=50100, sd=50)
t.test(before, after, var.equal = TRUE)
