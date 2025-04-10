library(dplyr)
data <- read.csv("dataset/british_household.csv")
summary(data)

# income 이상치 제거
data <- filter(data, income < 500)

# 화폐 단위 변수는 log를 취하는게 관행
data <- mutate(
  data,
  log_income = log(income),
  log_totexp = log(totexp),
  children_fac = factor(children, order=TRUE, labels=c("No", "Yes"))
)

# 필요 없는 열 제거
data <- select(data, -c(X, children, totexp, income))
summary(data)
glimpse(data)

# 상관계수
cor(data$log_income, data$wfood, method="pearson")
cor(data$log_income, data$log_totexp, method="pearson")

cor(data$log_income, data$wfood, method="spearman")
cor(data$log_income, data$log_totexp, method="spearman")

# 상관계수 행렬렬
cor_mat <- as.dist(round(cor(data[, 1:9]), 3))
cor_mat

# 유의수준
# install.packages("Hmisc")
library("Hmisc")

data_mat = as.matrix(data[, 1:9])
pmat <- rcorr(data_mat)

p_value <- round(pmat[["P"]], 4)
p_value

# 시각화
# install.packages("GGally")
library(GGally)
ggcorr(data)

library(ggplot2)
bi_plot <- ggpairs(data, columns = c("log_totexp", "log_income", "age", "wtrans"), 
        title = "Bivariate analysis of revenue expenditure by the British household",
        upper = list(continuous = wrap("cor", size = 3)),
        lower = list(continuous = wrap("smooth", alpha = 0.3, size = 0.1)),
        mapping = aes(color = children_fac)
)
bi_plot

ggsave("plot/bivariate-analysis.png", plot = bi_plot, width = 20, height = 20, units = "cm")
