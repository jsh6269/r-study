library(dplyr)

df <- mtcars %>%
  select(-c(am, vs, cyl, gear, carb))

head(df)

# linear model
model <- mpg ~ disp + hp + drat + wt
fit <- lm(model, df)
fit

summary(fit)

par(mfrow=c(2,2))
plot(fit)

fit$coefficients

library(GGally)

df <- mtcars %>%
  select(-c(am, vs, cyl, gear, carb))
ggscatmat(df, columns = 1: ncol(df))
