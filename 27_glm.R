# install.packages("mlbench")

library(mlbench)

data(PimaIndiansDiabetes)
df <- PimaIndiansDiabetes

head(df)

# Train/Test 분할
set.seed(42)
idx <- sample(1:nrow(df), 0.7 * nrow(df))
train <- df[idx, ]
test <- df[-idx, ]

# logistic regression
glm_model <- glm(diabetes ~ ., data = train, family = binomial)

# 예측
prob <- predict(glm_model, test, type = "response")
pred <- ifelse(prob > 0.5, "pos", "neg")
pred <- factor(pred, levels = levels(df$diabetes))

# 정확도 평가
conf_matrix <- table(Predicted = pred, Actual = test$diabetes)
print(conf_matrix)

accuracy <- mean(pred == test$diabetes)
cat("GLM Test Accuracy:", accuracy, "\n")
