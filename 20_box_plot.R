library(dplyr)
library(ggplot2)

data_air <- airquality %>%
  select(-c(Solar.R, Temp)) %>%
  mutate(Month = factor(Month, order=TRUE,
    labels = c("May", "June", "July", "August", "September")),
    day_cat = factor(
      ifelse(Day < 10, "Begin", ifelse(Day < 20, "Middle", "End"))
    )
  )

# 결측치 제거
data_air <- data_air %>% na.omit()
glimpse(data_air)

# box plot
box_plot <- ggplot(data_air, aes(x = Month, y = Ozone, color = Month))
box_plot <- box_plot +
  geom_boxplot(
    aes(fill = day_cat),
    outlier.colour = "red",
    outlier.shape = 2,
    outlier.size = 3
  ) +
  geom_jitter(shape = 15,
    color = "steelblue",
    position = position_jitter(width = 0.21)
  ) +
  labs(
    title = "Ozone (May ~ September)"
  ) +
#  coord_flip() +
  theme_classic() +
  stat_summary(fun.y = mean, geom = "point", size = 2)

ggsave("box-plot.png", plot = box_plot, width = 30, height = 15, units = "cm")
