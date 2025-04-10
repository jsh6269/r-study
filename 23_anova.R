library(dplyr)

df <- read.csv("poisons.csv") %>%
  select(-X) %>%
  mutate(poison = factor(poison, ordered = TRUE))

glimpse(df)

levels(df$poison)

df %>%
  group_by(poison) %>%
  summarise(
    count_poison = n(),
    mean_time = mean(time, na.rm = TRUE),
    sd_time = sd(time, na.rm = TRUE)
  )

ggplot(df, aes(x = poison, y = time, fill = poison)) +
  geom_boxplot() +
  geom_jitter(
    shape = 15,
    color = "steelblue",
    position = position_jitter(0.21)
  ) +
  theme_classic()

# H0: 그룹(poison)간 생종시간(time)의 평균에 차이가 없음
# H1: 적어도 한 그룹의 생존시간 평균이 다름
anova_one_way <- aov(time~poison, data = df)
summary(anova_one_way)

# pairwise comparison
TukeyHSD(anova_one_way)

# two-way ANOVA test
# 교호작용을 무시했을 때 poison과 treat가 각각 time에 영향을 미치는지
anova_two_way <- aov(time~poison + treat, data = df)
summary(anova_two_way)
