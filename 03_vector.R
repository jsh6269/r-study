# 벡터의 모든 요소는 같은 유형을 가짐
vec_num <- c(1, 10, 2)
vec_num

typeof(vec_num)
length(vec_num)
attributes(vec_num)

is.numeric(vec_num)

# coersion
# [1] "1" "a" "TRUE" "3.3"
vec_mul <- c(1, 'a', TRUE, 3.3)
vec_mul

vec_1 <- c(1, 2, 3)
vec_2 <- c(4, 5, 6)
vec_1 + vec_2
vec_1 + 3
vec_1 - vec_2
vec_1 * 2   # 곱하기
vec_1 * vec_2 # 내적
vec_1 ** 2  # 거듭제곱
vec_1 ^ 2   # 거듭제곱
vec_1 / 5   # 나누기
vec_1 %% 2  # 나머지
vec_1 %/% 2 # 몫

# subsetting
# [1] 1 2
sliced <- vec_1[1:2]
sliced

vec_3 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
vec_3[which(vec_3 %% 3 == 1)]

# sequence
vec_4 <- c(1:9)
vec_3 == vec_4

vec_5 <- seq(0, 1, length.out = 11)
vec_5

vec_6 <- seq(1.32, 5.23, by=0.12)
vec_6

vec_7 <- rep(1, 5)
vec_7

# names
x <- c(1, 2, 3)
names(x) <- c("a", "b", "c"); x

(y <- c(a=1, b=2, c=3))
