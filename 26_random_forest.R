# install.packages("palmerpenguins")
# install.packages("randomForest")

library(palmerpenguins)
library(randomForest)

# 데이터 로딩 및 전처리
data <- na.omit(penguins)  # 결측치 제거
data$species <- as.factor(data$species)
data$sex <- as.factor(data$sex)
data$island <- as.factor(data$island)

# Train/Test 분할
set.seed(42)
idx <- sample(1:nrow(data), 0.7 * nrow(data))
train <- data[idx, ]
test <- data[-idx, ]

# random forest
rf_model <- randomForest(
  species ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g + island + sex,
  data = train,
  ntree = 100,
  importance = TRUE
)

# 변수 중요도 출력
print(importance(rf_model))

# 테스트 예측
pred <- predict(rf_model, test)

# 혼동 행렬 및 정확도
conf_matrix <- table(Predicted = pred, Actual = test$species)
print(conf_matrix)

accuracy <- mean(pred == test$species)
cat("Random Forest Test Accuracy:", accuracy, "\n")
