# install.packages("palmerpenguins")
# install.packages("rpart")
# install.packages("rpart.plot")

library(palmerpenguins)
library(rpart)
library(rpart.plot)

# 결측치 제거
data <- na.omit(penguins)
head(data)

# 범주형 변수를 factor로 변환
data$species <- as.factor(data$species)
data$sex <- as.factor(data$sex)
data$island <- as.factor(data$island)

# Train/Test 분할
set.seed(42)
idx <- sample(1:nrow(data), 0.7 * nrow(data))
train <- data[idx, ]
test <- data[-idx, ]

# decision tree
model <- rpart(species ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g + island + sex,
               data = train, method = "class")

# 트리 시각화
rpart.plot(model)

# 예측
pred <- predict(model, test, type = "class")

# 혼동 행렬 & 정확도
conf_matrix <- table(Predicted = pred, Actual = test$species)
print(conf_matrix)

accuracy <- mean(pred == test$species)
cat("Test Accuracy:", accuracy, "\n")
