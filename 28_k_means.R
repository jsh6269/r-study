data(iris)

# Species(정답)은 제외하고 수치형 데이터만 사용
iris_data <- iris[, 1:4]

# K-means clustering (n_cluster=3)
set.seed(42)
kmeans_model <- kmeans(iris_data, centers = 3, nstart = 20)

print(kmeans_model)

# 클러스터링 결과와 실제 Species 비교
table(Cluster = kmeans_model$cluster, Actual = iris$Species)

library(ggplot2)
library(cluster)

# PCA로 2D로 축소
pca <- prcomp(iris_data, scale. = TRUE)
iris_pca <- data.frame(pca$x[, 1:2], Cluster = as.factor(kmeans_model$cluster))

# 시각화
ggplot(iris_pca, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point(size = 2) +
  labs(title = "K-means Clustering of Iris (PCA reduced)") +
  theme_minimal()
